  class MenusController < ApplicationController 
  T = Time.zone.now
  MENU_TIMES = {"Breakfast" => { "start_time" => "6:0:0", 
                                  "end_time" =>"10:44:59"},
                "Lunch" => {"start_time" => "10:45:00",
                            "end_time" => "15:44:59"},
                "Dinner" => {"start_time" => "15:45:0",
                             "end_time" => "21:44:59"},
                "Latenight" => { "start_time_today" => "21:45:0",
                                 "end_time_today" => "23:59:59",
                                 "start_time_next_day" => "0:0:0",
                                 "end_time_next_day" => "1:59:59"},
                "Brunch" => {"start_time" => "9:0:0",
                             "end_time" => "15:44:59"},
                "Default" => {"start_time" => "2:0:0",
                              "end_time" => "5:59:59"}

                }


  HAPPY_HOUR_TIME = {"Happy Hour" => {"start_time" => "15:45:00",
                                      "end_time" => "18:44:59"} }

  def show
    menu = get_live_menu
    @specific_menu = @live_menu
    if params[:menu]
      @menu_items = MenuItem.get_menu_items(params[:menu])
      @specific_menu = @menu_items[0].menu_type
        case @specific_menu
          when "Happyhour"
            @specific_menu = "Happy Hour"
          when "Latenight"
            @specific_menu = "Late Night"
        end
    else
      if(happy_hour_time?)
        @menu_items = MenuItem.get_menu_items(2,3)
        @live_menu = ["Happy Hour", "Dinner"] 
      else
        @menu_items = MenuItem.get_menu_items(menu)
      end  
    end
  resolve_layout
  end

  

  private

    def get_live_menu
      MENU_TIMES.each do |key, value|
        if menu_type_time(key, value)
          case key
            when "Breakfast"
              @live_menu = "Breakfast"
              return 0
            when "Lunch"
              @live_menu = "Lunch"
              return 1
            when "Dinner" 
              @live_menu = "Dinner"
              return 3
            when "Latenight"
              @live_menu = "Late Night"
              return 4
            when "Brunch"
              @live_menu = "Brunch"
              return 5
            else "Default"
              @live_menu = "Defualt"
              return 0
          end
        end 
      end
    end

    def menu_type_time(key, value)

      if key == "Latenight"
        start_today = Time.zone.parse(value["start_time_today"])
        end_today = Time.zone.parse(value["end_time_today"])
        start_tomorrow = Time.zone.parse(value["start_time_next_day"])
        end_tomorrow = Time.zone.parse(value["end_time_next_day"])
        Time.now.between?(start_today, end_today) || Time.now.between?(start_tomorrow, end_tomorrow)   
      else
       starting = Time.zone.parse(value["start_time"])
       ending = Time.zone.parse(value["end_time"])
      Time.now.between?(starting, ending) && (1..5).include?(T.wday) ||
      Time.now.between?(starting, ending) && [0,6].include?(T.wday)
      end  
    end

    def happy_hour_time?
      starting = Time.zone.parse(HAPPY_HOUR_TIME["Happy Hour"]["start_time"])
      ending = Time.zone.parse(HAPPY_HOUR_TIME["Happy Hour"]["end_time"])
      Time.now.between?(starting, ending) && (1..5).include?(T.wday)
    end

    def resolve_layout
       if User.is_admin?(current_user)
        render layout: "admin_layout"
      else
        render layout: "application"
      end
    end

    
end

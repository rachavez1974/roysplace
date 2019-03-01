  class MenusController < ApplicationController 
  T = DateTime.now.in_time_zone('Eastern Time (US & Canada)')
  MENU_TIMES = {"Breakfast" => { "start_time" => "6:0:0", 
                                  "end_time" =>"10:44:59"},
                "Lunch" => {"start_time" => "10:45:00",
                            "end_time" => "15:44:59"},
                "Dinner" => {"start_time" => "15:45:0",
                             "end_time" => "21:44:59"},
                "Latenight" => { "start_time_today" => "21:45:0",
                                 "end_time_today" => "23:59:59",
                                 "start_time_next_day" => "0:0:0",
                                 "end_time_next_day" => "2:0:0"},
                "Brunch" => {"start_time" => "9:0:0",
                             "end_time" => "15:44:59"}

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
      MENU_TIMES.each_with_index do |(key, value), index|
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
          end
        end
      end
    end

    def menu_type_time(key, value)
      if key == "Latenight"
        DateTime.now.between?(value["start_time_today"].to_time.in_time_zone('Eastern Time (US & Canada)'),
                              value["end_time_today"].to_time.in_time_zone('Eastern Time (US & Canada)')) || 
        DateTime.now.between?(value["start_time_next_day"].to_time.in_time_zone('Eastern Time (US & Canada)'),
                              value["end_time_next_day"].to_time.in_time_zone('Eastern Time (US & Canada)'))   
      else
        DateTime.now.between?(value["start_time"].to_time.in_time_zone('Eastern Time (US & Canada)'), 
                              value["end_time"].to_time.in_time_zone('Eastern Time (US & Canada)')) && 
                              (1..5).include?(T.wday) ||
        DateTime.now.between?(value["start_time"].to_time.in_time_zone('Eastern Time (US & Canada)'),
                              value["end_time"].to_time.in_time_zone('Eastern Time (US & Canada)')) && 
                              [0,6].include?(T.wday)
      end  
    end

    def happy_hour_time?
      DateTime.now.between?(HAPPY_HOUR_TIME["Happy Hour"]["start_time"].to_time.in_time_zone('Eastern Time (US & Canada)'),
                            HAPPY_HOUR_TIME["Happy Hour"]["end_time"].to_time.in_time_zone('Eastern Time (US & Canada)')) && 
                            (1..5).include?(T.wday)
    end

    def resolve_layout
       if User.is_admin?(current_user)
        render layout: "admin_layout"
      else
        render layout: "application"
      end
    end

    
end

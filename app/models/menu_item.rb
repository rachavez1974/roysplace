class MenuItem < ApplicationRecord
  enum menu_type: [:Breakfast, :Lunch, :Happyhour, :Dinner, :Latenight, :Brunch]
  enum section: [:Starters, :Classics, :Dishes, :A_La_Carte, :Confections]
  VALID_PRICE_REGEX = /^\d{1,4}(\.\d{0,2})?$/

  validates :name, presence: true, length: {maximum: 75}
  validates :description, presence: true, length: {maximum: 500}
  validates :price, presence: true, numericality: {greater_than: 0.0},
                                    format: {with: VALID_PRICE_REGEX, multiline: true}
  validates :section, presence: true, if: :section_present?
  validates :menu_type, presence: true, if: :menu_type_present?

  private

    #returns true if section includes in the array above
  def section_present?
    set_section
    section.include?(section)
  end

  def menu_type_present?
    set_menu_type
    menu_type.include?(menu_type)
  end

  def set_section
    if self.section.nil?
      self.section = "Starters" 
    else
      self.section
    end
  end

  def set_menu_type
    if self.menu_type.nil?
      self.menu_type = "Breakfast" 
    else
      self.menu_type
    end
  end
end

class Recipe < ActiveRecord::Base

  def ingredient_list
    ingredients.split(', ')
  end

  def instruction_list
    instructions.split(', ')
  end

  def friendly_updated_at
    updated_at.strftime('%b %e, %Y ')
  end

  def friendly_prep_time
    hours = prep_time / 60
    minutes = prep_time % 60
    printed_string = ""

    printed_string += "#{hours} #{'Hour'.pluralize(hours)}" if hours > 0
    printed_string += ", " if hours > 0 && minutes > 0
    printed_string += "#{minutes} #{'Minute'.pluralize(minutes)}" if minutes > 0

    printed_string
  end
end

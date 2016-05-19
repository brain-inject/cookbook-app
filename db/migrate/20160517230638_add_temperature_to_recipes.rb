class AddTemperatureToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :temperature, :integer
  end
end

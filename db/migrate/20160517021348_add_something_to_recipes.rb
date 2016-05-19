class AddSomethingToRecipes < ActiveRecord::Migration
  def change
    change_table :recipes do |t|
      t.change :prep_time, :float
      t.rename :instructions, :directions
      t.integer :price, :decimal, percision: 6, scale: 2
    end
  end
end

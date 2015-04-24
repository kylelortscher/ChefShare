class RemoveTextFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :text, :string
  end
end

class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.string :text
    	t.text :summary
    	t.text :description
    	t.timestamps
    end
  end
end

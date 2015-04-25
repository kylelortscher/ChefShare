require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

	def setup
		@chef = Chef.create(chefname: "bob", email: "bob@example.com")
		@recipe = @chef.recipes.build(name: "Chicken Parm", summary: "Best Chicken Parm In The World", description: "Heat Oil To 450 degress then add the tomato sauce, onions, then cook chicken for 20 minutes, and finally heat parmersna over it for 15 minutes in oven")
	end	

	test "Recipe should be valid" do
		assert @recipe.valid?
	end
	test "chef_id should be present" do
		@recipe.chef_id = nil
		assert_not @recipe.valid?
	end	
	test "name should be presenet" do
		@recipe.name = " "
		assert_not @recipe.valid?
	end
	test "summary should be presenet" do
		@recipe.summary = " "
		assert_not @recipe.valid?
	end
	test "descripition should be presenet" do
		@recipe.description = " "
		assert_not @recipe.valid?
	end
	test "name should not be too long" do
		@recipe.name = "a" * 101
		assert_not @recipe.valid?
	end
	test "summary should not be too long" do
		@recipe.summary = "a" * 151
		assert_not @recipe.valid?
	end
	test "description should not be too long" do
		@recipe.description = "a" * 501
		assert_not @recipe.valid?
	end
	
	test "name should not be too short" do
		@recipe.name = "aa"
		assert_not @recipe.valid?
	end	
	test "summary should not be too short" do
		@recipe.summary = "aa"
		assert_not @recipe.valid?
	end	
	test "description should not be too short" do
		@recipe.description = "aa"
		assert_not @recipe.valid?
	end	
end	
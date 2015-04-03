require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  
    def setup
      @chef = Chef.create(chefname: "Reggie", email: "reggie@go.com")
      @recipe = @chef.recipes.build(name:" tacos", summary: "this is good mexican food",
      description: "heat pan, add season, add sauce, simmer, clean up kitchen")
    end
   
       test  "recipe should be valid" do
         assert @recipe.valid?
       end
       
       test "chef_id should be present" do
         @recipe.chef_id = nil
         assert_not @recipe.valid?
       
       end
       
       
       test "name shoud be present" do
         @recipe.name = " "
         assert_not @recipe.valid?
        end
        
        test "name length must not be too long" do
          @recipe.name = "a" * 101
          assert_not @recipe.valid?
        
        end

         test "name length not too short" do
           @recipe.name = "aaaa"
           assert_not @recipe.valid?
         end
         
         test "summary should be present" do
           @recipe.summary = " "
            assert_not @recipe.valid?
         end
         
         test " summary length shout not b too long" do
           @recipe.summary = "a" * 151
           assert_not @recipe.valid?
           end
         
         test " summary should not b too short" do
           @recipe.summary = "a" * 9
           assert_not @recipe.valid?
         end

          test " description must be present" do
           @recipe.description = ""
           assert_not @recipe.valid?
          end
          
          test " description not be 2 long" do
            @recipe.description = "a" * 501
            assert_not @recipe.valid?
          end
          
          test " description not b too short" do
            @recipe.description = "a" * 19
            assert_not @recipe.valid?
          end
          
end
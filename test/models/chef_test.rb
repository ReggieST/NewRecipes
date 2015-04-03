
    require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: "reggie", email: "reggie@example.com")
  end
      
      test "chef shoud be valid" do
      assert @chef.valid?
    end
      
      test "chefname should be present" do
        
        @chef.chefname = ""
        assert_not @chef.valid?
      end
      
      test "chefname not be to long" do
      @chef.chefname = "a" * 41
      assert_not @chef.valid?
     end

      test "chefname not to short" do
         @chef.chefname = "aa"
         assert_not @chef.valid?
      end
     
     test " email should be present" do
       @chef.email = " "
       assert_not @chef.valid?
     end

    test " email should be within bounds" do
      @chef.email = "a" * 101 + "@example.com"
      assert_not @chef.valid?
    end
    test " email should be unique" do
      dup_chef = @chef.dup
      dup_chef.email = @chef.email.upcase
      @chef.save
      assert_not dup_chef.valid?
    end
      
      test "email validatio should accept valid addresses" do
        valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last.@eee.ou]
        valid_addresses.each do |va|
          @chef.email = va
          assert @chef.valid?, '#{va.inspect} should be valid'
      end
   end
     
         test "email should reject invalid email addresses" do
         invalid_addresses = %w[user@example,com user_at_eee.org  user.name@example. eee@i_om.com] 
         invalid_addresses .each do |ia|
          @chef.email = ia
          assert_not @chef.valid?, '#{ia.inspect} should be valid'
          end 
         end
end
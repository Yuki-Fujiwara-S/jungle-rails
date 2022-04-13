require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "product save successfuly" do
      @product = Product.new
      @cat = Category.new
      @cat.name = 'Cat1'
      @product.name = 'Product1' 
      @product.price_cents = 12311
      @product.quantity = 3
      @product.category = @cat
      expect(@product.valid?).to be true
    end

    it "name presence" do
      @product = Product.new

      # invalid 
      @product.name = nil
      @product.valid?
      expect(@product.errors[:name]).to  include("can't be blank")
  
      # valid 
      @product.name = 'Product2'  
      @product.valid? 
      expect(@product.errors[:name]).not_to  include("can't be blank")
    end

    it "price presence" do
      @product = Product.new


      # invalid
      @product.price_cents = nil 
      @product.valid?
      expect(@product.errors[:price_cents]).to  include("is not a number")
  
      # valid
      @product.price_cents = 12311  
      @product.valid? 
      expect(@product.errors[:price_cents]).not_to  include("is not a number")
    end
  
    it "quantity presence" do
      @product = Product.new

      # invalid
      @product.quantity = nil  
      @product.valid?
      expect(@product.errors[:quantity]).to  include("can't be blank")
  
       # valid 
      @product.quantity = 3
      @product.valid? 
      expect(@product.errors[:quantity]).not_to  include("can't be blank")
    end
  
    it "category presence" do
      @cat = Category.new
      @product = Product.new

      # invalid 
      @product.category = nil 
      @product.valid?
      expect(@product.errors[:category]).to  include("can't be blank")

      # valid 
      @product.category = @cat 
      @product.valid? 
      expect(@product.errors[:category]).not_to  include("can't be blank")
    end
  end
end
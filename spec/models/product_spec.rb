require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should create a product with all 4 fields' do
      @category = Category.new(name: 'test')
      @product = Product.new(name: 'test', price: 10, quantity:2, category: @category)
      expect(@product).to be_valid
      
    end

    it 'is not valid without a name' do
      @category = Category.new(name: 'test')
      @product = Product.new(name: nil, price:10, quantity:2, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.messages).to eq ({:name => ["can't be blank"]})
    end

    it 'is not valid without a price' do
      @category = Category.new(name: 'Test')
      @product = Product.new(name: 'Test', price: nil, quantity: 2,category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.messages).to eq ({:price => ["is not a number", "can't be blank"], :price_cents => ["is not a number"]})
    end

    it 'is not valid without a quantity' do
      @category = Category.new(name: 'Test')
      @product = Product.new(name: 'Test', price: 10, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.messages).to eq ({:quantity => ["can't be blank"]})
    end

    it 'is not valid without a category' do
      @category = Category.new(name: 'Test')
      @product = Product.new(name: 'Test', price: 10, quantity: 2, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.messages).to eq ({:category => ["can't be blank"]})
    end

  end
end
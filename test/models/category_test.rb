require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: 'Sports')
  end

  test 'Category is valid' do
    assert @category.valid?
  end
  test 'name should be present' do
    @category.name= ' '
    assert_not @category.valid? 
  end
  test 'name should be unique' do
    @category.save
    category2= Category.new(name:'Sports' )

    assert_not category2.valid? 
  end

  test 'name should not be too long' do
    @category.name= '12345678912'
    assert_not @category.valid? 
  end

  test 'name should not be too short' do
    @category.name= '12'
    assert_not @category.valid? 
  end


end
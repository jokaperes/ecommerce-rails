require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "should require name" do
    product = Product.new(price: 10.0)
    assert_not product.valid?
    assert_includes product.errors[:name], "can't be blank"
  end

  test "should require price" do
    product = Product.new(name: "Test Product")
    assert_not product.valid?
    assert_includes product.errors[:price], "can't be blank"
  end

  test "should not allow negative price" do
    product = Product.new(name: "Test Product", price: -5.0)
    assert_not product.valid?
    assert_includes product.errors[:price], "must be greater than or equal to 0"
  end

  test "should allow zero price" do
    product = Product.new(name: "Test Product", price: 0)
    assert product.valid?
  end

  test "ordered scope should return products in descending order by created_at" do
    product1 = products(:one)
    product2 = products(:two)

    # Update timestamps to ensure order
    product1.update_column(:created_at, 1.day.ago)
    product2.update_column(:created_at, Time.current)

    ordered_products = Product.ordered
    assert_equal product2.id, ordered_products.first.id
    assert_equal product1.id, ordered_products.last.id
  end

  test "with_associations scope should eager load associations" do
    product = products(:one)
    # This test ensures the scope doesn't raise an error
    # In a real scenario, you'd check for N+1 queries using a tool like bullet
    result = Product.with_associations.first
    assert_not_nil result
  end
end

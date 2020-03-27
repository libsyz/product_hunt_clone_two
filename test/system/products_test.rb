require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    #exercise
    visit "/"
    #well verified - X
    # make sure that I have the right products - OK
    # make sure that I am displaying all the products
    assert_selector "h1", text: "Awesome Products"
    assert_selector "h2", text: "Skello"
    assert_selector "h2", text: "Roadstr"
    assert_selector ".card-product", count: Product.count
  end
end

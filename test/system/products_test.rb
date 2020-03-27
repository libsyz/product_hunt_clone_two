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

  test "lets a signed in user create a new product" do
    login_as users(:george)
    visit "/products/new"
    save_and_open_screenshot

    # Test breaks here for now
    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"
    save_and_open_screenshot

    click_on 'Create Product'
    save_and_open_screenshot

    # Should be redirected to Home with new product
    assert_equal root_path, page.current_path
    assert_text "Change your life: Learn to code"
    # assert that the number of products in the database
    # has increased by one!
  end
end

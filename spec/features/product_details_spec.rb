require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
   # SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "They can view all products" do
  # ACT
  visit root_path

  # VERIFY
  find('a.btn-default').click

  expect(page).to have_content('Name')
  expect(page).to have_content('Description')
  expect(page).to have_content('Quantity')
  expect(page).to have_content('Price')

  # DEBUG
  save_screenshot

  end
end

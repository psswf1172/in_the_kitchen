require "rails_helper"

RSpec.describe "adding a recipe", type: :system do
  xit "allows a user to create a recipe with ingredients and instructions" do
    visit new_recipe_path
    fill_in "Title", with: "Test Recipe Title"
    fill_in "Description", with: "This description is the story of the recipe. It's being written to run tests."
    fill_in "Author", with: "Test User"
    click_on("Submit")
    visit recipes_path
    expect(page).to have_content("Test Recipe Title")
    expect(page).to have_content(8)
  end
end
require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create!(name: "Jen", email: "jen@email.com", password: "password") }
  let(:recipe) { Recipe.create(title: "ABC", author: "abc author", description: "abc abc abc", user: user) }
  
  it "starts recipe testing" do
    expect(Recipe.count).to equal 1
  end

end
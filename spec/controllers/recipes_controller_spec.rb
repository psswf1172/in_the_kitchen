require 'rails_helper'
require 'pry'

RSpec.describe RecipesController, type: :controller do
  
  describe "#create" do  
    context "success cases" do

      context "name is more than 3 characters" do
        it "responds with success status" do
          response = post :create, :params => { :recipe => { name: "Yum yum" } }
          expect(response.status).to eq 302
        end
      end #success

    end #error cases
  end #create
end
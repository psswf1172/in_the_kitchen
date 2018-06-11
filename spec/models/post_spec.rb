require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# for when testing search
# describe Product, search: true do
#   it "searches" do
#     Product.create!(name: "Apple")
#     Product.search_index.refresh
#     assert_equal ["Apple"], Product.search("apple").map(&:name)
#   end
# end

# and for when need to do factory bot
#   FactoryBot.define do
#   factory :product do
#     # ...

#     # Note: This should be the last trait in the list so `reindex` is called
#     # after all the other callbacks complete.
#     trait :reindex do
#       after(:create) do |product, _evaluator|
#         product.reindex(refresh: true)
#       end
#     end
#   end
# end

# # use it
# FactoryBot.create(:product, :some_trait, :reindex, some_attribute: "foo")
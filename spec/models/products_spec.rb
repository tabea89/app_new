require 'rails_helper'

describe Product do

  context "when the product has comments" do
    let(:product) { Product.create!(name: "race bike") }
    let(:user) { User.create!(email: "tabi.tab@hotmail.com", password: "wasgehtbeidir") }
    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "great!")
      product.comments.create!(rating: 5, user: user, body: "Amazing")
    end

    it "returns the average rating of all comments" do
      expect(product.comments.average(:rating)).to eq 3.0
    end

  end

  it "is not valid without a name" do
    expect(Product.new(description: "Nice bike")).not_to be_valid
  end

end
 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/funds", type: :request do
  
  # Fund. As you add validations to Fund, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Fund.create! valid_attributes
      get funds_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      fund = Fund.create! valid_attributes
      get fund_url(fund)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_fund_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      fund = Fund.create! valid_attributes
      get edit_fund_url(fund)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Fund" do
        expect {
          post funds_url, params: { fund: valid_attributes }
        }.to change(Fund, :count).by(1)
      end

      it "redirects to the created fund" do
        post funds_url, params: { fund: valid_attributes }
        expect(response).to redirect_to(fund_url(Fund.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Fund" do
        expect {
          post funds_url, params: { fund: invalid_attributes }
        }.to change(Fund, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post funds_url, params: { fund: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested fund" do
        fund = Fund.create! valid_attributes
        patch fund_url(fund), params: { fund: new_attributes }
        fund.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the fund" do
        fund = Fund.create! valid_attributes
        patch fund_url(fund), params: { fund: new_attributes }
        fund.reload
        expect(response).to redirect_to(fund_url(fund))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        fund = Fund.create! valid_attributes
        patch fund_url(fund), params: { fund: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested fund" do
      fund = Fund.create! valid_attributes
      expect {
        delete fund_url(fund)
      }.to change(Fund, :count).by(-1)
    end

    it "redirects to the funds list" do
      fund = Fund.create! valid_attributes
      delete fund_url(fund)
      expect(response).to redirect_to(funds_url)
    end
  end
end

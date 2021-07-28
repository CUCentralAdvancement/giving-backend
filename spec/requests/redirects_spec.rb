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

RSpec.describe "/redirects", type: :request do
  
  # Redirect. As you add validations to Redirect, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Redirect.create! valid_attributes
      get redirects_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      redirect = Redirect.create! valid_attributes
      get redirect_url(redirect)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_redirect_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      redirect = Redirect.create! valid_attributes
      get edit_redirect_url(redirect)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Redirect" do
        expect {
          post redirects_url, params: { redirect: valid_attributes }
        }.to change(Redirect, :count).by(1)
      end

      it "redirects to the created redirect" do
        post redirects_url, params: { redirect: valid_attributes }
        expect(response).to redirect_to(redirect_url(Redirect.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Redirect" do
        expect {
          post redirects_url, params: { redirect: invalid_attributes }
        }.to change(Redirect, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post redirects_url, params: { redirect: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested redirect" do
        redirect = Redirect.create! valid_attributes
        patch redirect_url(redirect), params: { redirect: new_attributes }
        redirect.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the redirect" do
        redirect = Redirect.create! valid_attributes
        patch redirect_url(redirect), params: { redirect: new_attributes }
        redirect.reload
        expect(response).to redirect_to(redirect_url(redirect))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        redirect = Redirect.create! valid_attributes
        patch redirect_url(redirect), params: { redirect: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested redirect" do
      redirect = Redirect.create! valid_attributes
      expect {
        delete redirect_url(redirect)
      }.to change(Redirect, :count).by(-1)
    end

    it "redirects to the redirects list" do
      redirect = Redirect.create! valid_attributes
      delete redirect_url(redirect)
      expect(response).to redirect_to(redirects_url)
    end
  end
end
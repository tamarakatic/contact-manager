require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe PhoneNumbersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # PhoneNumber. As you add validations to PhoneNumber, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { number: "MyString", person_id: 1 }
  }

  let(:invalid_attributes) {
    { number: nil, person_id: nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PhoneNumbersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      phone_number = PhoneNumber.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      phone_number = PhoneNumber.create! valid_attributes
      get :show, {:id => phone_number.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      phone_number = PhoneNumber.create! valid_attributes
      get :edit, {:id => phone_number.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:alice) do
        Person.create(first_name: 'Alice', last_name: 'Smith')
      end

      let(:valid_attributes) do
        { number: '555-1234', person_id: alice.id }
      end

      it "creates a new PhoneNumber" do
        expect {
          post :create, {:phone_number => valid_attributes}, valid_session
        }.to change(PhoneNumber, :count).by(1)
      end

      it "redirects to the phone_number's person" do
        alice = Person.create(first_name: 'Alice', last_name: 'Smith')
        valid_attributes = { number: '555-8888', person_id: alice.id }
        post :create, {:phone_number => valid_attributes}, valid_session
        expect(response).to redirect_to(alice)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, {:phone_number => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:bob) do
        Person.create(first_name: 'Bob', last_name: 'Jones')
      end

      let(:valid_attributes) do
        { number: '555-5678', person_id: bob.id }
      end

      let(:new_attributes) {
        { number: "MyNewString", person_id: bob.id }
      }

      it "updates the requested phone_number" do
        phone_number = PhoneNumber.create! valid_attributes
        put :update, {:id => phone_number.to_param, :phone_number => new_attributes}, valid_session
        phone_number.reload
        expect(phone_number.number).to eq("MyNewString")
        expect(phone_number.person_id).to eq(1)
      end

      it "redirects to the phone_number" do
        bob = Person.create(first_name: 'Bob', last_name: 'Jones')
        valid_attributes = { number: '555-5678', person_id: bob.id }
        phone_number = PhoneNumber.create! valid_attributes
        put :update, {:id => phone_number.to_param, :phone_number => valid_attributes}, valid_session
        expect(response).to redirect_to(bob)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        phone_number = PhoneNumber.create! valid_attributes
        put :update, {:id => phone_number.to_param, :phone_number => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested phone_number" do
      phone_number = PhoneNumber.create! valid_attributes
      expect {
        delete :destroy, {:id => phone_number.to_param}, valid_session
      }.to change(PhoneNumber, :count).by(-1)
    end

    it "redirects to the phone_numbers list" do
      phone_number = PhoneNumber.create! valid_attributes
      delete :destroy, {:id => phone_number.to_param}, valid_session
      expect(response).to redirect_to(phone_numbers_url)
    end
  end

end

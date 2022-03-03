require 'rails_helper'

RSpec.describe Api::ProductsController, type: :controller do
  describe "POST #create" do
    context 'when product save is successful' do
      it 'should save with the correct attributes' do
        post :create, params: { product: { name: 'Samsung S10', price: 30 } }
        expect(assigns(:product)).to be_a(Product)
        expect(assigns(:product)).to have_attributes(name: 'Samsung S10', price: 30)

      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Renderer, type: :controller do
  controller(ApplicationController) do
    include Renderer

    def show
      user = User.find(params[:id])
      render_object(user)
    end

    def create
      user = User.create(user_params)
      render_errors(user.errors)
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end

  describe 'GET show' do
    let(:resource) { create(:user) }

    it 'renders resource with render_object method' do
      get :show, params: { id: resource.id }

      resource_fields = { 'id' => resource.id, 'email' => resource.email }

      expect(response.status).to eq(200)
      expect(load_body(response)['user']).to include(resource_fields)
    end
  end

  describe 'POST create' do
    it 'renders resource errors with render_errors method' do
      post :create, params: { user: { email: nil, password: nil } }

      error_fields = {
        'email' => ['can\'t be blank'],
        'password' => ['can\'t be blank']
      }

      expect(response.status).to eq(422)
      expect(load_body(response)).to eq(error_fields)
    end
  end
end

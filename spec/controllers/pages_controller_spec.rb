# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #index' do
    it 'redirect to users#sessions new' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end

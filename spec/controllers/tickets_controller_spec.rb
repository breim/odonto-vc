# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe 'POST #create' do
    it 'create remote ticket' do
      post :create, params: { ticket: attributes_for(:ticket), format: :js }
      expect(response.content_type).to eq 'text/javascript'
    end
  end
end

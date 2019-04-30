# frozen_string_literal: true

require 'spec_helper'

RSpec.describe DeviseHelper, type: :helper do
  let(:resource_name) { :user }
  let(:devise_mapping) { Devise.mappings[:user] }

  context 'no error messages' do
    let(:resource) { User.new }
    it '#devise_error_messages!' do
      expect(devise_error_messages!).to eq('')
    end
  end

  context 'with error messages' do
    let(:resource) { User.create }
    it '#devise_error_messages!' do
      expect(devise_error_messages!).to_not eq('')
    end
  end
end

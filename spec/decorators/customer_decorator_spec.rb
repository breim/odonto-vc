# frozen_string_literal: true

require 'rails_helper'

describe CustomerDecorator do
  describe '#age' do
    let(:customer) { create(:customer, birthday: Date.today - 20.years).decorate }

    it 'when customer have birthday' do
      expect(customer.age).to eq('20 anos')
    end
  end
end

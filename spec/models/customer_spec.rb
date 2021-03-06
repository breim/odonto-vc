# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :consultations }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'methods' do
    context 'customer images' do
      it 'when customer dont have image #set_default_url' do
        customer = create(:customer, image: nil)
        expect(customer.image.url).to eq(customer.set_default_url)
      end
    end

    context 'CPF validation' do
      it 'save only digits when save CPF' do
        customer = build(:customer, cpf: '999.999.999-99')
        expect(customer.build_cpf).to eq('99999999999')
      end

      it 'when user dont fill cpf return nil' do
        customer = build(:customer, cpf: '')
        expect(customer.build_cpf).to eq(nil)
      end
    end
  end
end

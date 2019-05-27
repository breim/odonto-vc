# frozen_string_literal: true

require 'spec_helper'

describe FlashHelper do
  describe '#flash_class' do
    it ':notice' do
      expect(helper.flash_class(:notice)).to eq 'alert alert-success'
    end

    it ':success' do
      expect(helper.flash_class(:success)).to eq 'alert alert-success'
    end

    it ':error' do
      expect(helper.flash_class(:error)).to eq 'alert alert-danger'
    end

    it ':alert' do
      expect(helper.flash_class(:alert)).to eq 'alert alert-danger'
    end
  end
end

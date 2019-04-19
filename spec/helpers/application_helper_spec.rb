# frozen_string_literal: true

require 'spec_helper'

describe ApplicationHelper do
  describe '#current_link_helper' do

    before do
      allow(helper).to receive(:controller_name).and_return('calendars')
    end

    it 'when current controller is active' do
      expect(helper.current_link_helper('calendars')).to eq 'active'
    end
  end
end

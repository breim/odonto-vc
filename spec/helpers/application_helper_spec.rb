# frozen_string_literal: true

require 'spec_helper'

describe ApplicationHelper do

  describe '#navbar_header_link' do

    before do
      allow(helper).to receive(:controller_name).and_return('admin')
    end

    it 'when current controller is admin' do
      expect(helper.navbar_header_link('admin')).to eq '/admin'
    end

    #controller_name.split('/').first == 'admin' ? '/admin' : '/dashboard'

  end


  describe '#current_link_helper' do
    before do
      allow(helper).to receive(:controller_name).and_return('calendars')
    end

    it 'when current controller is active' do
      expect(helper.current_link_helper(helper.controller_name)).to eq 'active'
    end
  end




end

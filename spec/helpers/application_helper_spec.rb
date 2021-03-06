# frozen_string_literal: true

require 'spec_helper'

describe ApplicationHelper do
  describe '#navbar_header_link' do
    it 'when current controller is admin' do
      allow(helper).to receive(:controller_name).and_return('admin')
      expect(helper.navbar_header_link(helper.controller_name)).to eq '/admin'
    end

    it 'when current controller is not admin' do
      allow(helper).to receive(:controller_name).and_return('dashboard')
      expect(helper.navbar_header_link(helper.controller_name)).to eq '/dashboard'
    end
  end

  describe '#current_link_helper' do
    it 'when current controller is active' do
      allow(helper).to receive(:controller_name).and_return('calendars')
      expect(helper.current_link_helper(helper.controller_name)).to eq 'active'
    end
  end

  describe '#badge_status' do
    it 'return active badge status' do
      expect(helper.badge_status(true)).to eq("<span class='badge badge-success'>Active</span>".html_safe)
    end

    it 'return inactive badge status' do
      expect(helper.badge_status(false)).to eq("<span class='badge badge-danger'>Inactive</span>".html_safe)
    end
  end
end

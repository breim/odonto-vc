# frozen_string_literal: true

require 'rails_helper'

describe UserDecorator do

  describe '#created_last_week' do

    it 'total users created on last week' do
      expect(UserDecorator.decorate(User.all).created_last_week).to eq(User.where('created_at >= ?', 1.week.ago.utc).count)
    end
  end


  describe '#image' do
    it 'when user has gravatar' do
      user = create(:user, uid: nil).decorate
      expect(user.image).to eq("https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=150")
    end

    it 'when user has facebook' do
      user = create(:user, uid: '1100101').decorate
      expect(user.image).to eq("https://graph.facebook.com/#{user.uid}/picture?type=normal")
    end
  end
end

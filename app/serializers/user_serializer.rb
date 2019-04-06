# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :uid, :name, :email, :token, :disabled
end

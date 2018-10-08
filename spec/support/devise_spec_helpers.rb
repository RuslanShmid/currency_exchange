# frozen_string_literal: true

module DeviseSpecHelpers
  include Warden::Test::Helpers

  def sign_in(user = nil)
    user =
      if user.present?
        user
      else
        User.create(email: 'ivan@gmail.com', password: '12345678')
      end

    login_as(user, scope: :user)
  end

  def sign_out
    logout(:user)
  end
end

# frozen_string_literal: true

module DeviseSpecHelpers
  include Warden::Test::Helpers

  def sign_in(options = {})
    user =
      if options[:user].present?
        options[:user]
      else
        User.create(email: 'shmid@shmid.com', password: '12345678')
      end

    login_as(user, scope: :user)
  end

  def sign_out
    logout(:user)
  end
end

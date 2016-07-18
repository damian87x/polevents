class UserMailer < ApplicationMailer
  default from: "no-reply@polevents.pl"

  def notify_user(user)
    @user = user
    @url = ENV['HOST_NAME'] || 'localhost:3000'
    mail(to: @user.email, subject: 'New Events waiting for you!')
  end
end

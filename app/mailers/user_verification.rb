class UserVerification < ActionMailer::Base

  default from: "him.hkp@gmail.com"

  default_url_options[:host] = "localhost:3000"

  def password_reset_instructions(user)
    @edit_password_reset_url = edit_password_reset_url(user.perishable_token)
    mail(to: user.email, subject: "Password Reset Instructions")
  end

  def account_verification_instructions(user)
    @confirm_account_url = user_verification_url(user.perishable_token)
    mail(to: user.email, subject: "Validate your details")
  end

end

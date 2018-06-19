class PasswordResetWorker

  include Sidekiq::Worker
  sidekiq_options queue: "high"

  def perform(user_id)
    @user = User.find(user_id)
    UserVerification.password_reset_instructions(@user).deliver
  end
end
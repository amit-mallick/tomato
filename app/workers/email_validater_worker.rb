class EmailValidaterWorker

  include Sidekiq::Worker
  sidekiq_options queue: "high"

  def perform(user_id)
    @user = User.find(user_id)
    UserVerification.account_verification_instructions(@user).deliver
  end
end
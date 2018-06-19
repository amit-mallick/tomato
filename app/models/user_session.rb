class UserSession < Authlogic::Session::Base

  include ActiveModel::Conversion

  def persisted?
    false
  end

  validate :check_if_validated

  private

  def check_if_validated
    # render text: "Verify your account!"
    errors.add(:base, "Verify your account!") unless attempted_record && attempted_record.verified
  end

end

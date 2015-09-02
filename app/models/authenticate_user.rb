class AuthenticateUser

  include Virtus.model
  include ActiveModel::Model

  attribute :provider
  attribute :uid
  attribute :info, Hash
  attribute :credentials, Hash

  validates :provider, :uid, :info, presence: true

  # instantiate OmniauthSession with the controller env
  def self.build( omni_hash )
    self.new omni_hash.slice("provider", "uid", "info", "credentials")
  end

  def email
    info.fetch("email")
  end

  def save
    link_or_create_user
    authentication.save
  end

  def authentication
    @authentication ||= Authentication.
      where(attributes.slice(:provider, :uid)).first_or_initialize
  end

  def user
    @user ||= User.where(email: email).first_or_initialize
  end

private
  def link_or_create_user
    authentication.user || authentication.user = user
  end


end
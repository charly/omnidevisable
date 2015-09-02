class HomeController < ApplicationController
  # before_action :authenticate_email_id!, only: :secret
  before_action :user_signed_in?, only: :secret

  def index; end

  def secret; end
end

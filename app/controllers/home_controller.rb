class HomeController < ApplicationController
  before_action :authenticate_email_id!, only: :secret

  def index; end

  def secret; end
end

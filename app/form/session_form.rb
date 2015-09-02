class SessionForm

  include Virtus.model
  include ActiveModel::Model

  def self.model_name
    ActiveModel::Name.new(self, nil, "Session")
  end


  attribute :email
  attribute :password

end
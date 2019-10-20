class Message
  attr_accessor :name, :email, :body

  def initialize(params = {})
    @name = params[:name]
    @email = params[:email]
    @body = params[:body]
  end
end
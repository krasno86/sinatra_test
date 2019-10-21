class ParamsValidator
  def self.call(params)
    validator = Rack::Validator.new(params, true)
    validator.required [:name, :email, :body]
    validator.downcase :email
    validator.is_in_range 10, 32, :name
    validator.is_email :email
    validator.matches /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :email
    validator.is_greater_equal_than 50, :body
    validator
  end
end
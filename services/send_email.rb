class SendEmail
  attr_accessor :name, :email, :body, :file

  def initialize(params)
    @name = params[:name]
    @email = params[:email]
    @body = params[:body]
    @file = params[:file]
  end

  def perform
    attachments = file ? {file[:filename] => File.read(file[:tempfile])} : ''
    Pony.mail({
      from: email,
      to: ENV['ADMIN_EMAIL'],
      subject: "user #{name} feedback",
      body: body,
      attachments: attachments,
      via: :smtp,
      via_options: {
        address: 'smtp.gmail.com',
        domain: 'gmail.com',
        port: '587',
        user_name: ENV['USERNAME'],
        password: ENV['PASSWORD']
      }
  })
  end
end
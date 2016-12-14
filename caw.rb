require "sendgrid-ruby"
require "sinatra"

get "/" do
	erb :home
end

get "/contact" do
	erb :contact
end

post "/message-sent" do
	@name = params[:name]
	@company = params[:company]
	@email = params[:email]
	@subject = params[:subject]
	@content = params[:content]
	if params[:newcustomer] == "true"
		@sendto = "courtney.arpe.welsh+newbusiness@gmail.com"
	else
		@sendto = "courtney.arpe.welsh+clients@gmail.com"
	end

	from = SendGrid::Email.new(email: @email)
	subject = @name + " from " + @company + ": " + @subject
	to = SendGrid::Email.new(email: @sendto)
	content = SendGrid::Content.new(type: "text/plain", value: @content)

	mail = SendGrid::Mail.new(from, subject, to, content)
	sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
puts ENV['SENDGRID_API_KEY']
	response = sg.client.mail._("send").post(request_body: mail.to_json)

	erb :sent
end
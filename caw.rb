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
	@newcust = params[:newcustomer]
	@subject = params[:subject]
	@content = params[:content]
	@label = "+newbusiness" if @newcust == "true"
		else @label = "+clients"

	from SendGrid::Email.new (email: @email)
	subject = @name + " from " + @company + ": " + @subject
	to = SendGrid::Email.new (email: "courtney.arpe.welsh" + @label + "@gmail.com")
	content = SendGrid::Content.new (type: "text/plain", value: @content)

	mail = SendGrid::Mail.new (from, subject, to, content)
	sg = SendGrid::API.new (api_key: ENV['SENDGRID_API_KEY'])
	response = sg.client.mail._("send").post (request_body: mail.to_json)

	erb :sent
end
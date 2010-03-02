get '/register' do
	@user = User.new
	erb :"users/register"
end

post "/register" do
	@user = User.new(params[:user])
	if @user.save
		"Successfully Registered!!"
	else
		"Username already taken"
	end
end

get "/login" do
	erb:"users/login"
end

post "/login" do
	@user = User.find_by_username(params[:user][:username])
	user_entered_password = params[:user][:password]
	user_salt = @user.password_salt
	enc_pass = SHA1.hexdigest(user_salt + user_entered_password)
	if (@user.password == enc_pass)
		session[:uid] = @user.id.to_s
		"Welcome"
	else
		"Sorry, you are not a valid user!"
	end
end

get "/logout" do
	session[:uid] = nil
	redirect "/login"
end

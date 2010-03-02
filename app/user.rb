get '/register' do
	@user = User.new
	@uniqueness_failure = false
	@registration_success = false
	erb :"users/register"
end

post "/register" do
	@user = User.new(params[:user])
	if @user.save
		@registration_success = true
		erb :"users/register"
	else
		@uniqueness_failure = true
		erb :"users/register"
	end
end

get "/login" do
	@login_failure = false
	erb:"users/login"
end

post "/login" do
	@user = User.find_by_username(params[:user][:username])
	if(@user != nil)	
		user_entered_password = params[:user][:password]
		user_salt = @user.password_salt
		enc_pass = SHA1.hexdigest(user_salt + user_entered_password)
		if (@user.password == enc_pass)
			session[:uid] = @user.id.to_s
			"Welcome"
		else
			@login_failure = true
			erb :"users/login"
		end
	else
		@login_failure = true
		erb :"users/login"
	end
end

get "/logout" do
	session[:uid] = nil
	redirect "/login"
end

get "/" do
	@login_failure = false
	erb:"users/login"
end


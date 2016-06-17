## SESSION METHODS

# ----------------- Login Method -----------------

get '/login' do
    erb :login
  end

  def current_user
    if cookies.key? :remember_me
      user = User.find_by_remember_token(cookies[:remember_me])
      return user if user
    end

    if session.key?(:user_session)
      user = User.find_by_login_token(session[:user_session])
    end
  end

  get '/login' do
    if current_user
      erb :user_page
    else
      redirect '/login'
    end
  end

  post '/session' do
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_session] = SecureRandom.hex
      @user.login_token = session[:user_session]

      if params.key?('remember_me') && params[:remember_me] == 'true'

        if @user.remember_token
          response.set_cookie :remember_me, value: @user.remember_token, max_age: '2592000'
        else
          response.set_cookie :remember_me, value: SecureRandom.hex, max_age: '2592000'
          @user.remember_token = cookies[:remember_me]
        end
      end
    end

    @user.save
  end
end

# ----------------- Logout Method -----------------

get '/logout' do
  if current_user
    session.clear
    redirect :/
  end
end​

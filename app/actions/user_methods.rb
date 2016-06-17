# ----------------- User Methods -----------------

  #index
  get '/users'

  # new
  get '/users/new' do
    @user = User.new
    erb 'users/form'
  end

  # show
  get '/users/:id' do
    @user = User.find(params[:id])
    if @user
      erb '/users/show'
    else
      erb '/users'
    end
  end

  # create
  post '/users/' do
    @user = User.new(
      name: params[:name]
      email: params[:email]
      password: params[:password_digest]
    )
    if @user.save
      redirect_to "/users/#{@user.id}"
    else
      erb '/users'
    end
  end

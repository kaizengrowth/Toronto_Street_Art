# Homepage (Root path)
get '/' do
  @pictures = Picture.all
  erb :index
end

get '/search' do
  @street1 = params[:street1]
  @street2 = params[:street2]
  @intersections = Intersection.find_all_by_address(@street1, @street2)
  puts @intersections
  erb :'intersections/show'
end

get '/user_page' do
  if current_user
    @pictures = current_user.pictures
    @pictures.order(created_at: :DESC)
    erb :user_page
  else
    erb :login
  end
end

get '/signup' do
  erb :signup
end

get '/404' do
  erb :'/404'
end


## -------- Picture Controllers -------- ##

# Index
get '/pictures' do
  @pictures = Picture.all
  erb :index
end

# New
get '/user_page/pictures/new' do
 if current_user
   erb :'pictures/new'
 else
   erb :'users/signup'
 end
end

# Create
post '/pictures/new' do
 @new_picture = Picture.new(
   img_url: params[:img_url],
   artist_name: params[:artist_name],
   text: params[:text]
 )
 @new_intersection = Intersection.new(
   street1: params[:street1],
   street2: params[:street2]
 )
 @new_intersection.save
 @new_picture.user = current_user
 @new_picture.intersection = @new_intersection
 @new_picture.save
 redirect :user_page
end

# Update
get '/user_page/pictures/edit' do
 if current_user
   erb :'pictures/edit'
   binding.pry
 else
   erb :'users/signup'
 end
end

post '/user_page/pictures/edit' do
 @edit_picture =Picture.find params[:id]
 @edit_picture.update(
   artist_name: params[:artist_name],
   text: params[:text]
 )
 @edit_picture.save
 redirect :user_page
end

# Delete
post '/pictures/:id/delete' do
 @picture = Picture.find params[:id]
 @picture.destroy if @picture && @picture.user == current_user
 redirect :user_page
end

## -------- User Controllers -------- ##

# Index
get '/users' do
  @users = User.all
  erb :'/'
end

# New
get '/users/new' do
  redirect :'/signup'
end

# Show
get '/users/:id' do
  @user = User.find(params[:id])
  if @user
    redirect "/users/#{@user.id}"
  else
    erb :'/error_pages/404'
  end
end

# Create
post '/users/new' do
  @user = User.new(
    name: params[:name],
    email: params[:email],
    password_digest: params[Password.create(:password)]
  )
  @user.save
  redirect :'/'
end


## -------- Session Controllers -------- ##

# Login
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
      redirect '/signup'
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
    redirect :user_page
  end
#end

# Logout

get '/logout' do
  if current_user
    session.clear
  end
  redirect :'/'
end


## -------- Intersection Controllers -------- ##

# Index
get '/intersections' do
  @intersection = Intersection.all
  erb :index
end

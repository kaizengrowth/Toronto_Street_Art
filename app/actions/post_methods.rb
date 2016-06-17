# ----------------- Post Methods -----------------

# index
get '/posts'
​
# new
get '/posts/new' do
  @post = Post.new
  erb 'posts/form'
end
​
# show
get '/posts/:id' do
  @post = Post.find(params[:user_id, :intersection_id])
  if @post
    erb '/posts/show'
  else
    erb '/posts'
  end
end
​
# create
post '/posts' do
  @intersection = Intersection.find(params[:street1, :street2])

  if @intersection
    @post = Post.new(
      user_id: params[:user_id]
      intersection_id: @intersection.id
      img_url: params[:img_url]
      artist_name: params[:artist_name]
      text: params[:text]
    )
  else
    @intersection = Intersection.new(
      street1: params[:street1]
      street2: params[:street2]
    )
    @intersection.save
    @post = Post.new(
      user_id: params[:user_id]
      intersection_id: @intersection.id
      img_url: params[:img_url]
      artist_name: params[:artist_name]
      text: params[:text]
    )
  end

  if @post.save
    redirect_to "/posts/#{@post.id}"
  else
​    erb '/posts'
  end
end

# update

post '/posts/:id' do
  @post = Post.find(params[:user_id, :intersection_id])
  @post.update(
    user_id: params[:user_id]
    intersection_id: @intersection.id
    img_url: params[:img_url]
    artist_name: params[:artist_name]
    text: params[:text]
  )
  if @post.save
    redirect_to "/posts/#{@post.id}"
  else
​    erb '/posts'
  end
end

# delete

post '/posts/:id/delete' do
  @post = Post.find(params[:user_id, :intersection_id])
  @post.destroy
end

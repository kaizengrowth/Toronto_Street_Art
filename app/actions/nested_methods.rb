# # NESTED RESOURCEFULL ROUTES
# ​
# # index
# get '/users/:id/posts' do
#   @posts = User.find params[:user_id].posts
#   @posts.order('created_at DESC')
#   erb :'users/:id'
# end
# ​
# # show
# get '/users/:id/posts/:post_id'
# ​
# # new
# get '/users/:id/posts/new' do
#   erb 'posts/form'
# end
# ​
# # create
# post '/users/:id/posts' do
#   @user = find_user
#   @post = @user.posts.new(title: params[:title])
#   if @post.save
#     ...
#   end
# end
# ​
# get '/users/:id/posts/:id/edit' do
#   @post =
#   erb 'posts/form'
# end
# ​
# # edit
# get '/users/:id/edit' do
#   @user = User.find(params[:id])
#   erb 'users/form'
# end
# ​
# # update
# post '/users/:id' do
#   @user = User.find(params[:id])
#   @user.update(name: params[:name] ...)
#   if @user.save
# ​
#   else
# ​
#   end
# end
# ​
# post '/users/:id/delete' do
#
# end

# # ----------------- Intersection Methods -----------------
#
# # index
# get '/intersections'
#
# # new
# get '/intersections/new' do
#   @intersection = Intersection.new
#   erb 'intersections/form'
# end
#
# # show
# get '/intersections/:id' do
#   @intersection = Intersection.find_by(
#     street1: params[:street1],
#     street2: params[:street2]
#   )
#   if @intersection
#     erb '/intersections/show'
#   else
#     erb '/intersections'
#   end
# end
#
# # create
# post '/intersections/' do
#   @intersection = Intersection.new(
#     street1: params[:street1]
#     street2: params[:street2]
#   )
#   if @intersection.save
#     redirect_to "/intersections/#{@intersection.id}"
#   else
#     erb '/intersections'
#   end
# end

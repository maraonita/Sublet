class UserController < ApplicationController
  def my_profile
    authenticate_user!
    @requests = current_user.requests
    @requested_posts = Request.unconfirmed_for_buyer(current_user).map{|r| Post.find(r.post_id)}
    @incoming_requests = current_user.incoming_requests
    @to_confirm = Request.unconfirmed_for_seller(current_user) 
    @confirmed_for_seller = Request.confirmed_for_seller(current_user) 
    @confirmed_for_buyer = Request.confirmed_for_buyer(current_user)
    render 'devise/registrations/my_profile'
  end

  def profile
    authenticate_user!
    @user = User.find(params[:id])
    @posts = @user.posts
    render 'devise/registrations/profile'
  end
end
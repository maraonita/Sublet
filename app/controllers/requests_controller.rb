class RequestsController < ApplicationController
  before_action :find_request, only:[:show, :edit, :update, :destroy, :cancel, :accept_and_contact, :decline, :remove_confirmation]

  def index
    @requests = Request.all
  end

  def new
    authenticate_user!
    the_post = Post.find(params[:post_id])
    @request = Request.new(buyer_user_id: current_user.id, seller_user_id: the_post.user_id, post_id: the_post.id, canceled: false, confirmed: false)
    @request.save
  end

  def create
    authenticate_user!
    the_post = Post.find(params[:post_id])
    @request = Request.new(buyer_user_id: current_user.id, seller_user_id: the_post.user_id, post_id: the_post.id, canceled: false, confirmed: false)
    @request.save
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to) # go back
  end

  def show
  end

  def edit
  end

  def update
    if @request.belongs_to_user?(current_user)
      @request.update(post_params) ? (redirect_to @request) : (render 'edit')
    end
  end

  def accept_and_contact
    if @request.belongs_to_user?(current_user)
      @request.confirmed = true
      @request.save
    end
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to) # go back
  end

  def remove_confirmation
    if @request.belongs_to_user?(current_user)
      @request.confirmed = false
      @request.save
    end
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to) # go back
  end

  def decline
    if @request.belongs_to_user?(current_user)
      @request.canceled = true
      @request.save
    end
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to) # go back
  end

  def destroy
    if @request.belongs_to_user?(current_user)
      the_post = Post.find(@request.post_id)
      @request.destroy
    end
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to) # go back
  end

private

  # def authenticate_owner!(request)
  #   request.belongs_to_user?(current_user)
  # end

  def find_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit!
  end
end

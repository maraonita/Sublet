require 'will_paginate/array' 

class PostsController < ApplicationController
  include ApplicationHelper

  before_action :find_post, only:[:show, :edit, :update, :destroy]

  def index
    @posts = Post.where(booked: false).paginate(:page => params[:page], :per_page => 10)
  end

  def search # has a start_lease, end_lease
    @start_lease = date_from_param(params, :start_lease)
    @end_lease = date_from_param(params, :end_lease)
    @neighborhood_search_id = params[:neighborhood_id]["id"]
    @neighborhood_name = Neighborhood.find(@neighborhood_search_id).name
    @posts = Post.search_between_dates(@start_lease, @end_lease, @neighborhood_search_id)
    if @posts.empty?
      @no_search_results = true
      @posts = Post.all
    end
    @posts = @posts.paginate(:page => params[:page], :per_page => 10)
    render 'index'
  end

  def new
    authenticate_user!
    @post = current_user.posts.build
  end

  def create
    authenticate_user!
    @post = current_user.posts.build(post_params)
		if @post.save
			params[:images].try(:each) do |image| 
#				photo = Photo.create(image: image)
				@post.photos << Photo.create(image: image)
			end
			redirect_to @post
		else
			render 'new'
		end
  end

  def show
		@post = Post.find(params[:id])
  end

  def edit
  end

  def update
    authenticate_user!
    @post.update(post_params) ? (redirect_to @post) : (render 'edit')
  end

  def destroy
    authenticate_user!
    @post.destroy
    redirect_to root_path
  end

private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit!
    #                   .permit(:start_lease,
    #                               :end_lease,
    #                               :price,
    #                               :neighborhood_id,
    #                               :housing_type_id,
    #                               :room_type_id,
    #                               :bed_size_id,
    #                               :heating )
  end
end

class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def about
  end

  def contact
  end

  def profile
    @user = current_user
    @posts = Post.where(user_id: current_user)
  end

  def filter
    @posts = Post.all.where(publisher: filter_param)
  end

  private

  def filter_param
    params.require(:publisher)
  end
end

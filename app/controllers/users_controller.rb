class UsersController < ApplicationController
  
  def home
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id])
    studytimes = Array.new(7, 0)
    language = Array.new(7)
    today = Time.now.yday
    7.times do |i|
      studytimes[i] = @posts.map{|post| post.studytime if post.created_at.yday == (today - i)}
      language[i] = @posts.map{|post| post.language if post.created_at.yday == (today - i)}
    end
    gon.sudytimes = studytimes
    gon.language = language
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have update user successfully"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:name,:username,:twitter_account,:github,:biography,:image)
  end

end
class UsersController < ApplicationController
  
  def home
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    language = Language.all.map(&:language)
    list_of_studytime = Array.new(language.size, Array.new(7, 0))
    @stats = language.zip(list_of_studytime).to_h

    7.times do |i|
      temp = @posts.where(created_at: Time.current.ago(i.days).beginning_of_day..Time.current.ago(i.days).end_of_day).pluck(:language, :studytime).to_h
      
      temp.each do |key, value|
        @stats[key][i] = value #ここで詰まってる
      end
    end

    gon.stats = @stats
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
    params.require(:user).permit(:name, :username, :twitter_account, :github, :biography)
  end

end
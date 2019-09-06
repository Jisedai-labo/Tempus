class UsersController < ApplicationController
  
  def home
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    language = Language.all.map(&:language) #言語一覧
    #11,7の空の2次元配列を作る(これをハッシュにネストして、言語ごとに毎日どれだけ勉強したかをハッシュにしたい)
    list_of_studytime = Array.new(language.size, Array.new(7, 0))
    #キーを言語、値を空の配列にしたハッシュを作成
    #stats = {"HTML/CSS" => [0,0,.. 0,100], ..}みたいな感じです
    @stats = language.zip(list_of_studytime).to_h

    7.times do |i|
      #1日の言語ごとの勉強時間をハッシュにする=>i日前の勉強時間を取得して、statsのキーが一致した所に勉強時間を入れたい
      temp = @posts.where(created_at: Time.current.ago(i.days).all_day).pluck(:language, :studytime).to_h
      
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
    params.require(:user).permit(:name,:username,:twitter_account,:github,:biography,:image)
  end

end
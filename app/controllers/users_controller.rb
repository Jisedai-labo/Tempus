class UsersController < ApplicationController
  
  def home
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    list_of_languages = Language.all.pluck(:language) #言語一覧
    #11,7の空の2次元配列を作る(これをハッシュにネストして、言語ごとに毎日どれだけ勉強したかをハッシュにしたい)
    list_of_studytime = Array.new(list_of_languages.size)
    #キーを言語、値を空の配列にしたハッシュを作成
    #stats = {"HTML/CSS" => [0,0,.. 0,100], ..}みたいな感じです
    studytime = Array.new(7)

    11.times do |i|
      temp_studytime = Array.new(7, 0)
      7.times do |j|
        #1日の言語ごとの勉強時間をハッシュにする=>i日前の勉強時間を取得して、statsのキーが一致した所に勉強時間を入れたい
        timerange = Time.current.ago(j.days).beginning_of_day..Time.current.ago(j.days).end_of_day
        temp = @posts.where(created_at: timerange, language: list_of_languages[i]).pluck(:studytime)

        temp_studytime[j] = temp.sum
      end
      list_of_studytime[i] = temp_studytime
    end

    gon.language = list_of_languages
    gon.studytime = list_of_studytime
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
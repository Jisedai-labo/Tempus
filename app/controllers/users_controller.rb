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
    #大きさ11の配列=>これに言語ごとの勉強時間の配列(1週間分)を入れていく
    list_of_studytime = Array.new(list_of_languages.size)

    #言語の種類の数だけループを回し、各言語ごとに勉強時間の配列を作る
    11.times do |i|
      #list_of_studytimeに入れる.初期値は[0,0,0,0,0,0,0]
      #例えばi=1なら、list_of_languages[1]に入ってる言語の勉強時間を入れる
      #今回は言語と勉強時間分けてるけれど、デバッグする時考えると言語をキーにしたハッシュにすべきでした
      temp_studytime = Array.new(7, 0)

      7.times do |j|
        #1日分の時間を変数にとる
        timerange = Time.current.ago(j.days).beginning_of_day..Time.current.ago(j.days).end_of_day
        #tempに言語・timerangeで絞り込んで得られた勉強時間を格納
        temp = @posts.where(created_at: timerange, language: list_of_languages[i]).pluck(:studytime)

        temp_studytime[j] = temp.sum
      end
      #ループの最後にその言語の1週間の勉強時間をlist_of_studytimeに入れる
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
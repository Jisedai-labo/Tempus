class PostsController < ApplicationController
before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to posts_path
    else
      @posts = Post.all
      render :index
    end
  end
  
  def show
    @post = Post.find(params[:id])
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

        #エラー回避の為に一時的に2行削除

      end
      #ループの最後にその言語の1週間の勉強時間をlist_of_studytimeに入れる
      list_of_studytime[i] = temp_studytime
    end
    
    gon.language = list_of_languages
    gon.studytime = list_of_studytime
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post == current_user.posts.update(post_params)
    if @post.save
      flash[:notice] = "編集が完了しました"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "投稿が削除されました"
    redirect_to posts_path
  end

    private

      def post_params
        params.require(:post).permit(:language, :kyouzai, :content, :studytime)
      end

      def set_post
        @post = Post.find(params[:id])
      end
end

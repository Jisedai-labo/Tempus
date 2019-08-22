class PostsController < ApplicationController
before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
    @studytime = @post.build_studytime
  end

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.new(post_params)
    @studytime = @post.build_studytime(studytime_params)
    @studytime.post_id = @post.id
    if @post.save && @studytime.save
      flash[:notice] = "投稿しました"
      redirect_to posts_path
    else
      @posts = Post.all
      render :index
    end
  end
  
  def show
  end

  def edit
  end

  def update
    @post == current_user.posts.update(post_params)
    if @post.save
      flash[:notice] = "編集が完了しました"
      redirect_to posts_path
    else
      render 'posts/edit'
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "投稿が削除されました"
    redirect_to user_url
  end

    private

      def post_params
        params.require(:post).permit(:language, :kyouzai, :content)
      end

      def studytime_params
        params.require(:studytime).permit(:studytime)
      end

      def set_post
        @post = Post.find(params[:id])
      end
end

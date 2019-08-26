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
    if @post.save
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
        params.require(:post).permit(:language, :kyouzai, :content,
                                      studytime_attributes: [:studytime])
      end

      def set_post
        @post = Post.find(params[:id])
      end
end

class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
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
  end

  def update
    @post == current_user.posts.update(post_params)
    if @post.save
      flash[:notice] = "編集が完了しました"
      redirect_to user_url
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
        params.require(:post).permit(:content, :language, :user_id)
      end
end

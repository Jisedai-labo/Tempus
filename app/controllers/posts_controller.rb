class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to user_url(current_user)
    else
      render 'home/home'
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

  def index
    @post = Post.all
  end

  def destroy
    @post.destroy
    flash[:notice] = "投稿が削除されました"
    redirect_to user_url
  end

    private

      def post_params
        params.require(:post).permit(:content, :language)
      end
end

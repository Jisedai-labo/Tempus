class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to user_url
    else
      render 'posts/new'
    end
  end
  
  def show
    @post = Post.where(user_id: current_user.id)
  end

  def edit
    
  end

  def update
    if @post = current_user.posts.update_attributes(post_params)
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

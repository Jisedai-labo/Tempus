class FavoritesController < ApplicationController

    def create
        post = Post.find(params[:post_id])
        favorite = current_user.favorites.new(post_id: post.id)
        favorite.save
        redirect_to posts_path
    end

    def destroy
        post = Post.find(params[:post_id])
        favorite = current_user.favorites.new(post_id: post.id)
        favorite.destroy
        redirect_to posts_path
    end
end

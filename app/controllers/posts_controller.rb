class PostsController < ApplicationController
  def index
    @posts = Post.all.order(creted_at: :desc)
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.username = 'Pradeep'
    post.save
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end

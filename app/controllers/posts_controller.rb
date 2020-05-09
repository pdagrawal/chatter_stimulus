class PostsController < ApplicationController
  include CableReady::Broadcaster

  def index
    @posts = Post.order(id: :desc)
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.username = 'Pradeep'
    post.save
    cable_ready['timeline'].insert_adjacent_html(
      selector: '#timeline',
      position: 'afterbegin',
      html: render_to_string(partial: 'post', locals: { post: post })
    )
    cable_ready.broadcast
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end

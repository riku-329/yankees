class PostsController < ApplicationController  
before_action :authenticate_user!, only: [:new, :create]
    def index
        @posts = Post.all
    end

    def new
    @post = Post.new
    end

    def create
    @post = current_user.posts.build(post_params) # ← user_id のセットもこれでOK
    if @post.save
      redirect_to posts_path, notice: "投稿しました"
    else
      render :new, status: :unprocessable_entity
    end
    end

   def show
    @post = Post.find(params[:id])
   end

   
  private
  def post_params
    params.require(:post).permit(:name, :about, :image, :link, :youtube_url)
  end
end

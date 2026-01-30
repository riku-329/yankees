class PostsController < ApplicationController  
before_action :authenticate_user!, only: [:new, :create]
before_action :load_posts, only: [:index, :member, :result, :image, :video, :show] 
    def index
        @posts = Post.all
    end
    def member; end
    def result; end
    def image;
        @posts = Post.all 
    end

    def video; end
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
  def load_posts
    @posts = Post.all            # ここで一覧に使う@postsを用意
    # ユーザーの投稿だけにしたいなら current_user&.posts に変更
  end
  def post_params
    params.require(:post).permit(:name, :about, :image, :link, :youtube_url)
  end
end

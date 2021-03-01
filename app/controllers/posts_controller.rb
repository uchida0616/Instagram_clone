class PostsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @post.save
        #ContactMailer.contact_mail(@post).deliver
        redirect_to posts_path, notice: "ブログを作成しました！"
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"投稿を削除しました！"
  end

  def confirm
    @post = Post.new(post_params)
    @post.user_id = current_user.id#
    render :new if @post.invalid?
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :image, :image_cache)
  end

  def set_blog
    @post = Post.find(params[:id])
  end
end

class NewsController < ApplicationController
  before_action :check_login, except: [:index]

  def check_login
    redirect_to :login unless session[:user]
  end

  def index
    @noticias = News.all
    render layout: "index_layout"
  end

  def userpag
    if session[:user]["role"] == "administrator"
      @noticias = News.all
    else
      @noticias = News.where(user_id: session[:user]["id"])
    end
    render :userpag
  end

  def new
    @noticia = News.new
  end

  def create
    News.create(news_params.merge(user:User.find(session[:user]["id"])))
    redirect_to :news_userpag
  end

  def news_params
    params.require(:news).permit(:title, :subtitle, :body, :photo, :title_show,
     :subtitle_show, :body_show, :photo_show, :show)
  end

  def destroy
    noticia = News.find(params[:id])
    noticia.destroy
    redirect_to :news_userpag
  end

  def edit
    @noticia = News.find(params[:id])
  end

  def update
    noticia = News.find(params[:id])
    noticia.update(news_params)
    redirect_to :news_userpag
  end
end

class LoginController < ApplicationController
  def new

  end

  def create
    log = User.find_by_email(params[:email])
    unless log.nil?
      if log.password == params[:password]
        # usuário loga, criar uma sessão
        session[:user] = log
        redirect_to :news_userpag
      else
        @error = "Erro"
      end
    else
      @error = "Erro"
    end
    render :new if @error
  end

  def destroy
    session[:user] = nil
    redirect_to news_index_path
  end
end

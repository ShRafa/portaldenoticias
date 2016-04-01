class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :news_header
  helper_method :news_footer

  def news_header
    News.where(show: "Header")
  end

  def news_footer
    News.where(show: "Footer")
  end
end

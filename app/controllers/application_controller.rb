class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def moltin
    @moltin ||= Moltin::Client.new
  end
end

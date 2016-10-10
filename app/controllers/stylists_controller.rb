class StylistsController < ApplicationController
  def index
    @stylists = User.all.limit(10)
  end
  
end

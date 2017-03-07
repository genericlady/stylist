class StaticPagesController < ApplicationController
  def home
    skip_authorization
  end
end

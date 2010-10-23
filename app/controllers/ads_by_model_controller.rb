class AdsByModelController < ApplicationController
  def index
    @ads = Ad.find_all_by_user_id(session[:user_id], :order => "id DESC")
    @models = Model.find_all_by_user_id(session[:user_id])
  end
end


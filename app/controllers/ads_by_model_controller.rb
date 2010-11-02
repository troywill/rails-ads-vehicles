class AdsByModelController < ApplicationController
  def index
    user_id = session[:user_id]
    days = 30
    time = (Time.now - (days * 86400)).iso8601
    @ads = Ad.find_all_by_user_id(user_id, :conditions => "created_at > '#{time}'", :order => "year DESC, ad_price DESC")
    @ads = Ad.find_all_by_user_id(user_id, :conditions => ["(evaluated = ? OR interesting = ?) AND created_at > '#{time}'", false, true], :order => "year DESC, ad_price DESC")

    @models = Model.find_all_by_user_id(user_id)
  end
end

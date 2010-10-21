class AdByModelController < ApplicationController
  def index
    @ads = Ad.find(:all)
    @models = Model.find(:all)
  end
end

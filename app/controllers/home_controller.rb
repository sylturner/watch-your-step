class HomeController < ApplicationController

  def index
    @media = Medium.find(:all, :order => "id desc", :limit => 5).reverse
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @media }
    end
  end

end

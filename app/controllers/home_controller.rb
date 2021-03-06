class HomeController < ApplicationController

  def index
    @media = Medium.find(:all, :order => "updated_at desc", :limit => 10)
    @title = "Watch Your Step"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @media }
    end
  end

  def feed
    @media = Medium.find(:all, :order => "updated_at desc")
    respond_to do |format|
      format.atom
    end
  end

end

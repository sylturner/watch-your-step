class MediaController < ApplicationController

  before_filter :check_honeypot, :only => [:create, :edit, :update]

  # GET /media
  # GET /media.json
  def index
    @media = Medium.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @media }
    end
  end

  # GET /media/1
  # GET /media/1.json
  def show
    @medium = Medium.find(params[:id])
    @comment = Comment.new(:medium_id => params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @medium }
    end
  end

  # GET /media/new
  # GET /media/new.json
  def new
    @medium = Medium.new
    @medium.prompts.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @medium }
    end
  end

  # GET /media/1/edit
  def edit
    @medium = Medium.find(params[:id])
    @medium.prompts.build
  end

  # POST /media
  # POST /media.json
  def create
    @medium = Medium.new(params[:medium])

    respond_to do |format|
      if @medium.save
        format.html { redirect_to @medium, :notice => 'Medium was successfully created.' }
        format.json { render :json => @medium, :status => :created, :location => @medium }
      else
        format.html { render :action => "new" }
        format.json { render :json => @medium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /media/1
  # PUT /media/1.json
  def update
    @medium = Medium.find(params[:id])

    respond_to do |format|
      if @medium.update_attributes(params[:medium])
        format.html { redirect_to @medium, :notice => 'Medium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @medium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /media/1
  # DELETE /media/1.json
  def destroy
    @medium = Medium.find(params[:id])
    @medium.destroy

    respond_to do |format|
      format.html { redirect_to media_url }
      format.json { head :no_content }
    end
  end

  def add_prompt
    @medium = Medium.find(params[:id])
    @medium.prompts.build
    respond_to do |format|
      format.js {render :layout => false }
    end
  end


  def check_honeypot
    # check that email param and don't submit anything if it's populated
    # used to catch spambots
    if !params[:email].blank?
      render :action => "new"
    end
  end

end

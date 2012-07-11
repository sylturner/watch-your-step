class VersionsController < ApplicationController

  def revert
    @version = Version.find(params[:id])
    get_medium @version.reify
    @medium.save!

    redirect_to @medium, :notice => "Reverted to version from #{@version.created_at}"
  end

  def view
    @version = Version.find(params[:id])
    get_medium @version.reify
    
    respond_to do |format|
      format.html
      format.json { render :json => @medium }
    end   
  end

  def get_medium obj
    # crappy, but whatever...
    if obj.is_a? Medium
      @medium = obj
    else
      # (unsafely) assumes the other things are children of medium
      @medium = obj.medium
    end
  end
end

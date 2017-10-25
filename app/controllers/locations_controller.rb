class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.company_id = current_user.company_id
   if @location.save
    @location.user_locations.create(user_id:current_user.id,location_id:@location)
    redirect_to @location
   else
     render :action => new
   end
    #render plain: params[:location].inspect
  end

  def show
    @location = Location.find(params[:id])
  end

  def index
    @locations =current_user.locations
  end

  private

  def location_params
    params.require(:location).permit(:name, :company_id)
  end
end

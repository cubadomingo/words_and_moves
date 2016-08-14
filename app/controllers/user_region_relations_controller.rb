class UserRegionRelationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_region
  before_action :set_user

  def subscribe
    @user.subscribe!(@region)
    redirect_back(fallback_location: root_path)
  end

  def unsubscribe
    @subscription = @user.preferred_regions.find_by(params[:id])
    @user.preferred_regions.delete(@subscription)
    redirect_back(fallback_location: root_path)
  end

  private

  def set_region
    @region = Region.find(params[:region_id])
  end

  def set_user
    @user = current_user
  end
end

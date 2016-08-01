class RegionsController < ApplicationController

  def explore
    #currently have this so the navbar can work but the nav won't have a region name for the explore
    @region = Region.find(2)
    @regions = Region.all
  end

  def feed
    @region = Region.find(1)
    @subregions = @region.subregions.all
  end

  def event
    #this will eventually get passed in params for the navbar
    @region = Region.find(1)
  end

  def post
    #this will eventually get passed in params for the navbar
    @region = Region.find(2)
  end

end

class ResortLocationSweeper < ActionController::Caching::Sweeper
  
  observe ResortLocation
  
  def after_save(resort_location)
    clear_resort_locations_cache(resort_location)
  end
  
  def after_destroy(resort_location)
    clear_resort_locations_cache(resort_location)
  end
  
  def clear_resort_locations_cache(resort_location)
    expire_page :controller => :resort_locations, :action => :index
    expire_page :controller => :resort_locations, :action => :show, :id => resort_location
  end
  
end
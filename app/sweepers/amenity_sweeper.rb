class AmenitySweeper < ActionController::Caching::Sweeper
  
  observe Amenity
  
  def after_save(amenity)
    clear_amenities_cache(amenity)
  end
  
  def after_destroy(amenity)
    clear_amenities_cache(amenity)
  end
  
  def clear_amenities_cache(amenity)
    expire_page :controller => :amenities, :action => :index
    expire_page :controller => :amenities, :action => :show, :id => amenity
  end
  
end
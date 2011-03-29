class ResortSweeper < ActionController::Caching::Sweeper
  
  observe Resort
  
  def after_save(resort)
    clear_resorts_cache(resort)
  end
  
  def after_destroy(resort)
    clear_resorts_cache(resort)
  end
  
  def clear_resorts_cache(resort)
    expire_page :controller => :resorts, :action => :show, :id => resort
  end
  
end
class ParadiseSweeper < ActionController::Caching::Sweeper
  
  def clear_paradise_cache
    expire_page :controller => :paradise, :action => :index
  end
  
end
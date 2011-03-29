class SuiteSweeper < ActionController::Caching::Sweeper
  
  observe Suite
  
  def after_save(suite)
    clear_suites_cache(suite)
  end
  
  def after_destroy(suite)
    clear_suites_cache(suite)
  end
  
  def clear_suites_cache(suite)
    expire_page :controller => :suites, :action => :index
    expire_page :controller => :suites, :action => :show, :id => suite
  end
  
end
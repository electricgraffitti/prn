class SuiteSpecSweeper < ActionController::Caching::Sweeper
  
  observe SuiteSpec
  
  def after_save(suite_spec)
    clear_suite_specs_cache(suite_spec)
  end
  
  def after_destroy(suite_spec)
    clear_suite_specs_cache(suite_spec)
  end
  
  def clear_suite_specs_cache(suite_spec)
    expire_page :controller => :suite_specs, :action => :index
    expire_page :controller => :suite_specs, :action => :show, :id => suite_spec
  end
  
end
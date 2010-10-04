class LabelSweeper < ActionController::Caching::Sweeper
  observe Label
  
  def after_save(label)
    expire_cache(label)
  end
  
  def after_destroy(label)
    expire_cache(label)
  end
  
  def expire_cache(label)
    #expire_page :controller => 'users', :action => 'show', :id => params[:id], :format => 'pdf'
    expire_page :controller => 'labels', :action => 'index'
  end
end

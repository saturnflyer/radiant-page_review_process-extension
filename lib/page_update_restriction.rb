module PageUpdateRestriction
  def self.included(base)
    base.class_eval{ before_filter :restrict_changes, :only => [:edit, :remove] }
  end
      
  def restrict_changes
    page = Page.find(params[:id])
    unless page.savable_by_user?(current_user)
      flash[:notice] = "You don't have priveleges to make changes to the \"#{page.title}\" page."
      redirect_to page_index_path
    end
  end
end
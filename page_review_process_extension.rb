# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PageReviewProcessExtension < Radiant::Extension
  version "1.0"
  description "Sets up user roles for managing and reviewing pages."
  url "http://saturnflyer.com/"
  
  class MissingRequirement < StandardError; end
  
  def activate
    raise PageReviewProcessExtension::MissingRequirement.new('RbacBaseExtension must be installed and loaded first.') unless defined?(RbacBaseExtension)
    Page.send :include, PageReview
    Admin::PageController.send :include, PageUpdateRestriction
  end
  
  def deactivate
    # admin.tabs.remove "Page Review Process"
  end
  
end
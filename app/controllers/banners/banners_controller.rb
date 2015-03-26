class Banners::BannersController < Wheelhouse::ResourceController
  self.resource_class = Banners::Banner
  self.section = :"configuration/banners"
  
  before_filter { authorize!(:edit, site) }
  
  breadcrumb { ["Banners", banners_path] }
  
  def index
    @banners = Banners::Banner.alphabetical
  end

protected
  def build_resource
    super.tap { |banner| banner.site = site }
  end
end

class Banners::JavascriptController < Wheelhouse::BaseController
  before_filter { request.format = :js }
  caches_page :all, :tagged
  
  def all
    @banners = Banners::Banner.decorate
    render "banners"
  end
  
  def tagged
    @banners = Banners::Banner.tagged_with(params[:tag]).decorate
    render "banners"
  end
end

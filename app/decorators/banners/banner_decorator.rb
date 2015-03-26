class Banners::BannerDecorator < Wheelhouse::Decorator
  decorates Banners::Banner
  
  def as_json(options={})
    result = { :label => source.label, :images => images }
    
    if source.url?
      result[:url] = source.url
      result[:target] = source.target if source.target?
    end
    
    result
  end

private
  def images
    images = {}
    breakpoints.each do |label, breakpoint|
      url = source.image(label).url
      images[breakpoint] = url if url.present?
    end
    images
  end
  
  def breakpoints
    Banners::Plugin.config.wheelhouse.banners.breakpoints
  end
end

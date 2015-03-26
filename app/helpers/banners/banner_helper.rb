module Banners::BannerHelper
  def banner(tag=:all)
    javascript_include_tag("/banners/#{tag.to_s.parameterize}", :id => "banner") + noscript_banner_fallback(tag)
  end

private
  def noscript_banner_fallback(tag=:all)
    banner = Banners::Banner.default(tag)
    content_tag(:noscript, link_to_if(banner.url?, banner.default_image, banner.url)) if banner && banner.default_image.present?
  end
end

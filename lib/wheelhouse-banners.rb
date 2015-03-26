require 'wheelhouse'

module Banners
  class Plugin < Wheelhouse::Plugin
    config.wheelhouse.banners = ActiveSupport::OrderedOptions.new
    
    # Set default breakpoints
    config.wheelhouse.banners.breakpoints = { "Default" => :default }
    
    isolate_namespace Banners
    
    section(:configuration) {
      Section(:"configuration/banners", banners.banners_path,
        :icon => "banners/banner.png",
        :if   => proc { can?(:edit, site) }
      ) do |section|
        section.link(:"configuration/banners.new_banner", banners.new_banner_path)
      end
    }
    
    config.precompile << "banners/admin.*"
  end
end

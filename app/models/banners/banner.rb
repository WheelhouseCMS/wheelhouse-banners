module Banners
  class Banner < Wheelhouse::Resource
    belongs_to :site, :class => 'Wheelhouse::Site'
    
    property :label, String, :required => true
    property :url, String
    property :target, String, :default => "_blank"
    property :images, Map[String => Wheelhouse::Media::ImageReference]
    property :tags, Wheelhouse::Tags
    
    activities :all
    
    icon "banners/banner.png"
    
    index :_tags
    before_save { attributes[:_tags] = tags.map(&:parameterize) }
    
    scope :alphabetical, order(:label.asc)
    scope :tagged_with, lambda { |tag| where(:_tags => tag.to_s) }
    
    after_save    :clear_cache!
    after_destroy :clear_cache!
    
    self.decorator = Banners::BannerDecorator
    
    def image(label)
      images[label] || Wheelhouse::Media::ImageReference.new
    end
    
    def default_image
      images.values.first
    end
    
    def self.all_tags
      selector = MongoModel::MongoOptions.new(self, {}).to_a.first
      collection.distinct(:tags, selector)
    end
    
    def self.default(tag=nil)
      tags = ["default"]
      tags << tag if tag && tag != :all
      tagged_with(tags).first
    end
  end
end

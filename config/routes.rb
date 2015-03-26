# Admin routes (scoped to /admin)
Banners::Plugin.routes.draw do  
  extend Wheelhouse::RouteExtensions
  
  resources :banners
end

# Front-end routes
Rails.application.routes.draw do
  controller "banners/javascript" do
    get "/banners/all.js"  => :all
    get "/banners/:tag.js" => :tagged
  end
end

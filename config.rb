activate :directory_indexes
activate :autoprefixer
activate :sprockets

set :relative_links, true
set :css_dir, "assets/stylesheets"
set :js_dir, "assets/javascripts"
set :images_dir, "assets/images"
set :fonts_dir, "assets/fonts"
set :layout, "layouts/application"

configure :development do
  activate :livereload
end

configure :build do
  activate :relative_assets
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
end

helpers do
  def link_to(link, url, opts={})
    if current_resource.url == url_for(url)
      opts[:class] = "active"
    end
    super(link, url, opts)
  end
end

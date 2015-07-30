activate :i18n, path: "/:locale/"

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript

  # Use relative URLs
  # activate :relative_assets
end

activate :deploy do |deploy|

  deploy_filename = File.expand_path('../deploy.yml', __FILE__)
  if File.exists?(deploy_filename)
    require 'yaml'

    YAML.load_file(deploy_filename).each do |method, value|
      deploy.public_send(:"#{ method }=", value)
    end
  else
    puts "Missing '%s'" % [deploy_filename]
    exit
  end

end

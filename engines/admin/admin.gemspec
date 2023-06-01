require_relative "lib/admin/version"

Gem::Specification.new do |spec|
  spec.name        = "admin"
  spec.version     = Admin::VERSION
  spec.authors     = ["misu"]
  spec.email       = ["szijjartonagy.misu@gmail.com"]
  spec.homepage    = 'https://github.com/SzNagyMisu/barrack-app-rails'
  spec.summary     = 'admin logic for the barrack app'
  spec.description = 'admin routes, controllers, views'
    spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = 'https://github.com/SzNagyMisu/barrack-app-rails'
  spec.metadata["changelog_uri"] = 'https://github.com/SzNagyMisu/barrack-app-rails'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.4.3"
end

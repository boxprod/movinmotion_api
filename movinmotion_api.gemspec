require_relative "lib/movinmotion_api/version"

Gem::Specification.new do |spec|
  spec.name        = "movinmotion_api"
  spec.version     = MovinmotionApi::VERSION
  spec.authors     = ["Victor Holl"]
  spec.email       = ["v_h@me.com"]
  spec.homepage    = "TODO"
  spec.summary     = "A simple Movinmotion API client."
  spec.description = "This gem allows you to access Movinmotion data for your account by adding your session cookie to the configuration. Movinmotion API is not publicly open and this Gem uses visible access points from their website. Please use carefully and respectfully."
  spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.4"
end

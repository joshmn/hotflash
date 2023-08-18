require_relative "lib/hot_flash/version"

Gem::Specification.new do |spec|
  spec.name        = "hot_flash"
  spec.version     = HotFlash::VERSION
  spec.authors     = ["joshmn"]
  spec.email       = ["josh@josh.mn"]
  spec.homepage    = "https://github.com/joshmn/hot_flashes"
  spec.summary     = "Automatically inject flash messages into TurboStream responses."
  spec.description = spec.summary
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md", "CHANGELOG.md"]
  end

  spec.add_development_dependency "rspec-rails"
end

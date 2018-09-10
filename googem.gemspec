
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "googem/version"

Gem::Specification.new do |spec|
  spec.name          = "googem"
  spec.version       = Googem::VERSION
  spec.authors       = ["ThienLV"]
  spec.email         = ["ohmygodvt95@gmail.com"]

  spec.summary       = %q{Use stackoverflow.com with commandline interface. Happy coding.}
  spec.description   = %q{Use stackoverflow.com with commandline interface. No browsers, no interface, only terminal. LIKE a BOSS}
  spec.homepage      = "https://github.com/ohmygodvt95/googem.git"
  spec.license       = "MIT"
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.add_dependency 'unirest'
  spec.add_dependency 'oj'
  spec.add_dependency 'tty-spinner'
  spec.add_dependency 'tty-pager'
  spec.add_dependency 'tty-prompt'
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end

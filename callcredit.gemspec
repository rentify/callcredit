# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "callcredit"
  spec.version       = '0.3.0'
  spec.authors       = ["Aleksandar Simic"]
  spec.email         = ["aleks@rentify.com"]
  spec.description   = %q{Call Credit API client gem}
  spec.summary       = %q{Call Credit API client gem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "savon", "2.2.0"
  spec.add_dependency "nokogiri", "1.6.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.13"
  spec.add_development_dependency "active_support", "3.0.0"
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "callcredit"
  spec.version       = '0.9.6'
  spec.authors       = ["Aleksandar Simic"]
  spec.email         = ["aleks@rentify.com"]
  spec.description   = %q{a hopefully sane consumer of Call Credit API}
  spec.summary       = %q{Call Credit API client gem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "savon", "~> 2.12"
  spec.add_dependency "nokogiri", "1.8.4"
  spec.add_dependency "i18n"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3"
  spec.add_development_dependency "activesupport", "3.0.0"
  spec.add_development_dependency "webmock", "1.11.0" # 'older' version, so it plays nice with VCR
  spec.add_development_dependency "vcr", "2.5.0"
  spec.add_development_dependency "safe_yaml", "1.0.4"
  spec.add_development_dependency "pry"
end

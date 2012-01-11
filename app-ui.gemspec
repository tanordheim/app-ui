# encoding: utf-8
# vim:ft=ruby

$:.push File.expand_path("../lib", __FILE__)
require 'app_ui/rails/version'

Gem::Specification.new do |s|
  s.name          = 'app-ui'
  s.version       = AppUi::Rails::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Trond Arve Nordheim']
  s.email         = ['t@binarymarbles.com']
  s.homepage      = 'https://github.com/binarymarbles/app-ui'
  s.summary       = 'Base UI for Binary Marbles web applications'

  s.files         = Dir['lib/**/*'] + Dir['vendor/**/*'] + ['README.md']
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'jquery-rails', '>= 1.0'
  s.add_runtime_dependency 'less-rails', '~> 2.1.0'
  s.add_runtime_dependency 'kaminari'
  s.add_runtime_dependency 'railties'
  s.add_runtime_dependency 'actionpack'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rails', '>= 3.1.1'
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "list_for/version"

Gem::Specification.new do |s|
  s.name        = 'list_for'
  s.version     = ListFor::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Craig Buchek']
  s.email       = ['craig@boochtek.com']
  s.homepage    = 'http://github.com/boochtek/list_for'
  s.summary     = 'Simplified index (list) views for Rails, in spirit of Formtastic, SimpleFor, ShowFor'
  s.description = s.summary
  s.license     = 'MIT'

  s.add_dependency 'activemodel',       '~> 3.0.3'
  s.add_dependency 'actionpack',        '~> 3.0.3'
  s.add_dependency 'activesupport',     '~> 3.0.3'

  #s.add_development_dependency 'rspec'

  #s.rubyforge_project = 'list_for'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

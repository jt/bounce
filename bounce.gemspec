# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'bounce/version'

Gem::Specification.new do |s|
  s.name        = 'bounce'
  s.version     = Bounce::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['John Thomas Marino']
  s.email       = 'writejm@gmail.com'
  s.homepage    = 'http://github.com/johmas/bounce'
  s.summary     = "bounce is a rails method that saves and returns an active record object. If you like skinny controllers, you'll love bounce."
  s.description = %q{

  `bounce` will save and return an active record object. This results in a nice refactor of update and create actions in your controllers. This works really well with `respond_with`.
  }

  s.rubyforge_project = 'bounce'

  s.files          = %w( README.md Rakefile LICENSE )
  s.files         += Dir.glob("lib/**/*")

  s.require_paths = ['lib']
end

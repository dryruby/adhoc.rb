#!/usr/bin/env ruby -rubygems
# -*- encoding: utf-8 -*-

GEMSPEC = Gem::Specification.new do |gem|
  gem.name               = 'adhoc'
  gem.version            = '0.0.0'
  gem.date               = '2009-04-25'
  gem.homepage           = 'http://github.com/bendiken/adhoc'
  gem.license            = 'MIT' if gem.respond_to?(:license=)
  gem.summary            = 'Ad-hoc service discovery and routing for DNS-SD (aka Bonjour) and XMPP.'
  gem.description        = ''
  gem.rubyforge_project  = 'adhoc'

  gem.author             = 'Arto Bendiken'
  gem.email              = 'arto.bendiken@gmail.com'

  gem.platform           = Gem::Platform::RUBY
  gem.files              = %w(LICENSE README README.rdoc Rakefile VERSION bin/adhoc lib/adhoc.rb lib/adhoc/dnssd.rb lib/adhoc/version.rb lib/adhoc/xmpp.rb)
  gem.files             -= %w(README.rdoc) # only for GitHub
  gem.bindir             = %q(bin)
  gem.executables        = %w(adhoc)
  gem.default_executable = gem.executables.first
  gem.require_paths      = %w(lib)
  gem.extensions         = %w()
  gem.test_files         = %w()
  gem.has_rdoc           = false

  gem.required_ruby_version      = '>= 1.8.2'
  gem.requirements               = []
  gem.add_development_dependency 'rakefile'
  #gem.add_runtime_dependency     'dnssd',  '>= 0.7.1'
  #gem.add_runtime_dependency     'xmpp4r', '>= 0.4'
  gem.post_install_message       = nil
end

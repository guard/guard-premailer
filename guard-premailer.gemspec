# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'guard/premailer/version'

Gem::Specification.new do |s|
  s.name        = 'guard-premailer'
  s.version     = Guard::PremailerVersion::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Immanuel Häussermann']
  s.email       = ['haeussermann@gmail.com']
  s.homepage    = ''
  s.summary     = %q{Guard gem for premailer}
  s.description = %q{Runs html files through premailer to prepare them for sending them as email}

  s.rubyforge_project = 'guard-premailer'

  s.add_dependency('guard', '>= 0.4')
  s.add_dependency('premailer', '>= 0.3.1')

  s.add_development_dependency('rspec')

  s.files         = Dir.glob('{lib}/**/*') + %w[LICENSE README.md Gemfile]
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']
end
# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
Gem::Specification.new do |s|
  s.name        = "oai"
  s.version     = '0.0.12'
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Oai client/provider/harvester"
  s.description = "something"
 
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "oai"
  s.authors = ['Ed Summers','Will Groppe','Terry Reese','Chick Markley']
  s.add_development_dependency "rspec"
 
  # s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md ROADMAP.md CHANGELOG.md)
  s.files        = Dir.glob("{bin,lib}/**/*")
  s.executables  = ['oai']
  s.require_path = 'lib'
end

require File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spec_filler/version'

Gem::Specification.new do |s|
  s.name            = 'spec_filler'
  s.version         = '0.0.6'
  s.executables     = ['spec_filler']
  s.date            = '2019-08-28'
  s.summary         = 'Create a FactoryBot file'
  s.description     = 'Use your schema to fill out a FactoryBot file'
  s.authors         = ['publicover']
  s.email           = 'jameslpublicover@gmail.com'
  s.require_paths   = ['lib']
  s.files           = ['lib/spec_filler.rb']
  s.license         = 'MIT'
end

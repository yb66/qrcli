# encoding: UTF-8

require 'rspec'
require 'rspec-given'
Spec_dir = File.expand_path( File.dirname __FILE__ )


# code coverage
require 'simplecov'
SimpleCov.start do
  add_filter "/vendor/"
  add_filter "/vendor.noindex/"
  add_filter "/bin/"
  add_filter "/coverage/"
end



Dir[ File.join( Spec_dir, "/support/**/*.rb")].each do |f|
  require f
end

RSpec.configure do |config|
end

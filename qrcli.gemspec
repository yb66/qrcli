# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "qrcli/version"

Gem::Specification.new do |s|
  s.name        = "qrcli"
  s.version     = Qrcli::VERSION
  s.authors     = ["John Hawthorn"]
  s.email       = ["john.hawthorn@gmail.com"]
  s.licenses    = ['MIT']
  s.homepage    = "https://github.com/jhawthorn/qrcli"
  s.summary     = %q{Generates QR codes on the command line using ANSI terminal colors}
  s.description = %q{Generates QR codes on the command line using ANSI terminal colors}

  s.rubyforge_project = "qrcli"

  s.add_runtime_dependency 'rqrcode', ">= 0.10.1"
  s.add_runtime_dependency "docopt",  ">= 0.6.1"
  # Dev dependencies in the Gemfile

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- exe/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

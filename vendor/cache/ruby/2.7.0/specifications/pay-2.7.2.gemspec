# -*- encoding: utf-8 -*-
# stub: pay 2.7.2 ruby lib

Gem::Specification.new do |s|
  s.name = "pay".freeze
  s.version = "2.7.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jason Charnes".freeze, "Chris Oliver".freeze]
  s.date = "2021-08-16"
  s.description = "Stripe, Paddle, and Braintree payments for Ruby on Rails apps".freeze
  s.email = ["jason@thecharnes.com".freeze, "excid3@gmail.com".freeze]
  s.homepage = "https://github.com/pay-rails/pay".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Payments engine for Ruby on Rails".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 4.2"])
    s.add_development_dependency(%q<minitest-rails>.freeze, [">= 6", "< 7.0"])
    s.add_development_dependency(%q<mocha>.freeze, [">= 0"])
    s.add_development_dependency(%q<standardrb>.freeze, [">= 0"])
    s.add_development_dependency(%q<vcr>.freeze, [">= 0"])
    s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 4.2"])
    s.add_dependency(%q<minitest-rails>.freeze, [">= 6", "< 7.0"])
    s.add_dependency(%q<mocha>.freeze, [">= 0"])
    s.add_dependency(%q<standardrb>.freeze, [">= 0"])
    s.add_dependency(%q<vcr>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
  end
end

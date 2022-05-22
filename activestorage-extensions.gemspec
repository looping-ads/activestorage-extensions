# frozen_string_literal: true

require_relative "lib/active_storage_extensions/version"

Gem::Specification.new do |spec|
  spec.name = "activestorage-extensions"
  spec.version = ActiveStorageExtensions::VERSION
  spec.authors = ["paulhenri-l"]
  spec.email = ["25308170+paulhenri-l@users.noreply.github.com"]
  spec.summary = "Add functionality to activestorage"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.add_dependency "rails", ">= 7.0.2.3"
end

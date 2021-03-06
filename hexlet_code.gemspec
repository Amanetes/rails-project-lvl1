# frozen_string_literal: true

require_relative 'lib/hexlet_code/version'

Gem::Specification.new do |spec|
  spec.name = 'hexlet_code'
  spec.version = HexletCode::VERSION
  spec.authors = ['Sergey Fatyukhin']
  spec.email = ['ser_8904@mail.ru']

  spec.summary = 'Form generator.'
  spec.description = 'Makes it easy to create forms in website templates.'
  spec.homepage = 'https://github.com/Amanetes/rails-project-lvl1'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.1'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Amanetes/rails-project-lvl1'
  spec.metadata['changelog_uri'] = 'https://github.com/Amanetes/rails-project-lvl1'
  spec.metadata['rubygems_mfa_required'] = 'true'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end

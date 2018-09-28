Gem::Specification.new do |spec|
  spec.name = 'embulk-input-redash'
  spec.version = '0.1.2'
  spec.authors = ['ariarijp']
  spec.summary = 'Redash input plugin for Embulk'
  spec.description = 'Loads records from Redash.'
  spec.email = ['takuya.arita@gmail.com']
  spec.licenses = ['MIT']
  spec.homepage = 'https://github.com/ariarijp/embulk-input-redash'

  spec.files = `git ls-files`.split("\n") + Dir['classpath/*.jar']
  spec.test_files = spec.files.grep(%r{^(test|spec)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rest-client'
  spec.add_development_dependency 'bundler', ['>= 1.16.1']
  spec.add_development_dependency 'embulk', ['>= 0.8.39']
  spec.add_development_dependency 'rake', ['>= 12.3.1']
  spec.add_development_dependency 'test-unit', ['>= 3.2.8']
  spec.add_development_dependency 'webmock', ['>= 3.4.2']
end

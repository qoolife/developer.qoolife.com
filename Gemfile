source "http://rubygems.org"
ruby '2.2.2'

# Thin to serve content from Heroku
gem 'thin'
gem 'rack'
gem 'rack-rewrite', require: 'rack-rewrite'
gem 'rack-contrib', require: 'rack/contrib'

# Mime-types for handling mime types
gem 'mime-types', require: 'mime/types'

gem 'rake', '~> 10.4'
gem 'compass'

group :development do
  # Nanoc for compiling dynamic code
  gem 'nanoc', '~> 3.6.3'
  gem "guard-nanoc"

  # Kramdown for markdown syntax
  gem 'kramdown', '~> 0.13.2'
  gem 'nokogiri', '~> 1.6'

  # HAML / SASS syntax
  gem "haml"
  gem "sass"

  # Compressing and minifying
  gem "rainpress"
  gem "uglifier"

  # Could not find the required 'adsf' gem, which is necessary for the view command.
  gem 'adsf'

  # needed for nanoc watch
  gem 'fssm'
end

source "http://rubygems.org"
ruby '1.9.3'

# Thin to serve content from Heroku
gem 'thin'
gem 'rack'
gem 'rack-rewrite', :require => 'rack-rewrite'
gem 'rack-contrib', :require => 'rack/contrib'

# Mime-types for handling mime types
gem 'mime-types', :require => 'mime/types'

gem 'rake', '~> 0.9.2'

group :development do
  # Nanoc for compiling dynamic code
  gem 'nanoc', '~> 3.3.1'

  # Kramdown for markdown syntax
  gem 'kramdown', '~> 0.13.2'
  gem 'nokogiri', '~> 1.5.2'
end

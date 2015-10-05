require 'bundler'
Bundler.require

use Rack::ResponseHeaders do |headers|
  headers['Content-Type'] = 'text/html; charset=utf-8' if headers['Content-Type'] == 'text/html'
end
use Rack::Deflater
use Rack::StaticCache, urls: ["/images", "/stylesheets", "/javascripts", "/fonts"], root: "output"
use Rack::TryStatic,
  root: "output",
  urls: %w[/],
  try:  ['.html', 'index.html', '/index.html']

run lambda { |env|
  [404, { 'Content-Type'  => 'text/plain'}, ['404 - page not found']]
}

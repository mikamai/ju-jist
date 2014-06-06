require 'open-uri'

def call(env)
  parts = %r{^/?(?<gist_id>\w+)/(?<user>[^/]*)/(?<file>.*)(?:$|\?(?<query>.*$))}.match(env['PATH_INFO'])
  gist_id = parts[:gist_id]
  file = parts[:file]
  user = parts[:user]
  contents = open("https://gist.githubusercontent.com/#{user}/#{gist_id}/raw/#{file}")
  [200, {}, [contents.read]]
end

use Rack::Static, urls: %w[/gist-runner.rb], index: 'index.html'
run self

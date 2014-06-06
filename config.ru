require 'open-uri'

def call(env)
  parts = %r{^/?(?<gist_id>\w+)/(?<file>.*)(?:$|\?(?<query>.*$))}.match(env['PATH_INFO'])
  gist_id = parts[:gist_id]
  file = parts[:file]
  [200, {}, open("https://gist.githubusercontent.com/elia/#{gist_id}/raw/#{file}")]
end

run self

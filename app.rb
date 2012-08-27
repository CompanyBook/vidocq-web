require 'sinatra'
require 'vidocq'
require 'json'

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/index.json' do
  vidocq = Vidocq.new
  content_type :json
  return vidocq.services.to_json
end

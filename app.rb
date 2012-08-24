require 'sinatra'
require 'vidocq'
require 'json'

get '/' do
  vidocq = Vidocq.new
  content_type :json
  return vidocq.services.to_json
end

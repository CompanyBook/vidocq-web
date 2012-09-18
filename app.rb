require 'sinatra'
require 'vidocq'

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/index.json' do
  content_type :json
  return Vidocq.services('namenode.companybook.no:2181,sec-namenode.companybook.no:2181,jobtracker.companybook.no:2181').to_json
end

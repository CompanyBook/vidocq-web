require 'sinatra'
require 'vidocq'

ZOOKEEPERS = %w{datanode1.companybook.no datanode2.companybook.no datanode21.companybook.no namenode.companybook.no jobtracker.companybook.no}

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/index.json' do
  content_type :json
  return Vidocq.services(ZOOKEEPERS.join(':2181,') + ':2181').to_json
end

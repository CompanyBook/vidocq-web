require 'sinatra'
require 'vidocq'

TSO_ZOOKEEPERS = %w{032 026 009 005 011}.collect {|i| "companybook-#{i}.servers.eqx.misp.co.uk"}
RACKSPACE_ZOOKEEPERS = %w{datanode1.companybook.no datanode2.companybook.no datanode21.companybook.no namenode.companybook.no jobtracker.companybook.no}

set :bind, '0.0.0.0'

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/index.json' do
  content_type :json
  return Vidocq.services(RACKSPACE_ZOOKEEPERS.join(':2181,') + ':2181').to_json
end

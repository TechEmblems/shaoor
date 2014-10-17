class Core < Grape::API
version 'v1', using: :header, vendor: 'regdevice', cascade: false
format :json
end

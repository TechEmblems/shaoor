class RegdeviceAPI < Grape::API
  version 'v1', using: :header, vendor: 'regdevice', cascade: false
  format :json

  mount V1::Core
end
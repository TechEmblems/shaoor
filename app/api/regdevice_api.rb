class RegdeviceAPI < Grape::API
  format :json

  mount V1::Core
end
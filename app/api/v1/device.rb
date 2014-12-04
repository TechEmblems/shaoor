module V1
  class Device < Grape::API
    namespace 'Device'

    resource :devices do
      desc 'GET DEVICES'
      get '/' do
        @devices = Device.where(user_id: params[:user_id])
      end
    end
    add_swagger_documentation
  end
end

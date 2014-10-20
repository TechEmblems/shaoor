module V1
  class Device < Grape::API

    resource :devices do
      before { current_user }

      desc 'GET DEVICES OF CURRENT_USER'
      get '/' do
        @devices = @current_user.devices
      end

      desc 'ADD NEW DEVICE FOR CURRENT_USER'
      params do

      end
      post '/' do
        @device = @current_user.devices.build(device_params)

        if @device.save
          @device
        else
          @device.errors
        end
      end
    end

    add_swagger_documentation
  end
end
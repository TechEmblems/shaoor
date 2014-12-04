module V1
  class Profile < Grape::API
    namespace 'Profile'

    resource :profiles do
      desc 'EDIT PROFILE'
      params do
        requires :id, type: Integer, desc: 'User ID'
      end
      get ':id' do
        @user = ::User.find(params[:id])
      end

      put ':id' do

      end
    end
    add_swagger_documentation
  end
end

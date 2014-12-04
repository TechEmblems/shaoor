module V1
  class Core < Grape::API
    version 'v1', using: :header, vendor: 'regdevice', cascade: false

    helpers do
      def current_token;
        env['api.token']
      end

      def current_user;
        @current_user ||= ::User.find(current_token.resource_owner_id) if current_token
        authorize
      end
      def authorize;
        @ability = ::Ability.new(@current_user)
      end
    end

    doorkeeper_for :all, scopes: [:public, :user]

    mount Profile
    mount Device
  end
end
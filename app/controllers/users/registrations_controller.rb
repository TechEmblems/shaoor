class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters


  #def create
  #  build_resource(configure_permitted_parameters)
  #
  #  if resource.save
  #    respond_to do |format|
  #      format.html {
  #        yield resource if block_given?
  #        if resource.active_for_authentication?
  #          set_flash_message :notice, :signed_up if is_flashing_format?
  #          sign_up(resource_name, resource)
  #          respond_with resource, :location => after_sign_up_path_for(resource)
  #        else
  #          set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
  #          expire_data_after_sign_in!
  #          respond_with resource, :location => after_inactive_sign_up_path_for(resource)
  #        end
  #      }
  #      format.js {
  #        flash[:notice] = "Created account, signed in."
  #        render :template => "remote_content/devise_success_sign_up.js.erb"
  #        flash.discard
  #        sign_up(resource_name, resource)
  #      }
  #    end
  #  else
  #    respond_to do |format|
  #      format.html {
  #        clean_up_passwords resource
  #        respond_with resource
  #      }
  #      format.js {
  #        flash[:alert] = @user.errors.full_messages.to_sentence
  #        render :template => "remote_content/devise_errors.js.erb"
  #        flash.discard
  #      }
  #    end
  #  end
  #end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)#.push(:name, :cnic, :phone, devices_attributes: [:type, :key])
  end
end
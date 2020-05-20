class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, :only => [:create]

  def new_company
    @producer = Producer.new
  end

  def create_company
    Producer.create(user_id: current_user.id, company_name: params[:company_name])
    redirect_to company_details_path
  end

  protected 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u| 
      u.permit(:isProducer, :email, :fname, :lname, :password, :password_confirmation) 
    end
  end

  def after_sign_up_path_for(resource)
    if current_user.isProducer
      company_signup_path
    else
      root_path
    end
  end 
end
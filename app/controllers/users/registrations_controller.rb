class Users::RegistrationsController < Devise::RegistrationsController
   #before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new
     @user = User.new
   end

  # POST /resource

   def create
     @user = User.new(user_params)
     @user.role_id = 2
     @company = @user.create_company(name: @user.name)
     if @user.save
       UserMailer.welcome_email(@user).deliver
       flash[:notice] = "Company #{@company.name} successfully created"
       redirect_to @company
     else
       render :action => 'new'
     end
   end

   def new_user
     if current_user.role.name == 'location_manager'||current_user.role.name =='account_admin'
     @user =User.new
     else
       flash[:notice] ='I am User Admin'
     end
   end

   def create_new_user
     @user = User.new(user_params)
     @user.manager_id = current_user.id
     @user.company_id = current_user.company_id
     if @user.save
       flash[:notice] = "User with  #{Role.find(@user.role_id)} successfully created"
       redirect_to index_users_path
     else
       render :action => 'new_user'
     end
   end

   def show
     @user = User.find(params[:id])
   end

   def index
     @users = User.where(manager_id:current_user.id)
   end

   private
   def user_params
     params.require(:user).permit(:name, :email,:password, :password_confirmation, :role_id,:company_id,:manager_id)
   end
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

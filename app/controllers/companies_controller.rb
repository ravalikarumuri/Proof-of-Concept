class CompaniesController < ApplicationController
  before_action :authenticate_user!,except: [:homepage,:sign_out_and_redirect]

  def index
    @companies =Company.all
    if current_user.role.name == 'user_admin'
      flash[:notice]=' Hello User admin'
      redirect_to view_user_details_path(id: current_user.id)
    else
      redirect_to new_account_user_registration_path
    end
  end

  def show
    @company =Company.find(params[:id])
  end

  def homepage

  end

end

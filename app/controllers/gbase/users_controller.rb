require_dependency "gbase/application_controller"

module Gbase
  class UsersController < ApplicationController

    def index
    	@q = User.search(params[:q])
    	@users = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
    end

    def new
    	@user = User.new
    end

    def create
    	@user = User.new(secure_params)
    	respond_to do |format|
	      if @user.save
	        format.html { redirect_to @user, notice: 'Usuário criado com sucesso.' }
	        format.json { render :show, status: :created, location: @user }
	      else
	        format.html { render :new }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
    end

    def update
    	if params[:user][:password].blank?
	      params[:user].delete(:password)
	      params[:user].delete(:password_confirmation)
	    end
    	@user = User.find(params[:id])
	    if @user.update_attributes(secure_params)
	      sign_in(@user, :bypass => true) if @user == current_user
	      redirect_to user_path, :flash => { :success => 'Usuário alterado com sucesso.' }
	    else
	      render :action => 'edit'
	    end
    end

    def show
	    @user = User.find(params[:id])
	    respond_to do |format|
	        format.html
	        format.json { render :json => @user.to_json }
	    end
    end

    def edit
    	@user = User.find(params[:id])
    end

    def destroy
	    user = User.find(params[:id])
	    user.destroy
	    redirect_to users_path, :notice => "Usuário excluído com sucesso."
	end

    private

	  def secure_params
	    params.require(:user).permit(:role, :name, :email, :password, :password_confirmation)
	  end

  end
end

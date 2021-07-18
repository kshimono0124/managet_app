class UsersController < ApplicationController
  # before_action :set_q, only: [:show, :search]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @q = Client.ransack(params[:q])
    @client = @q.result(distinct: true)
    # @client_search = Client.ransack(params[:q])
    # @clients = @client_search.result
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user || @user.update(user_params)
      flash[:notice] = "プロフィールが更新されました"
      redirect_to mypage_path
    else
      flash[:alert] = "プロフィールが入力されていません"
      render :edit
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end
  
  # def search
  #   @results = @q.result
  # end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
    end
    
    # def set_q
    #   @q = Client.ransack(params[:q])
    # end
end

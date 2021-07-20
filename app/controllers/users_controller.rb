class UsersController < ApplicationController
  
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end
  
  def show
    @user = User.find(params[:id])
    # @q = Client.ransack(params[:q])
    # @client = @q.result(distinct: true)
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
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
    end
end

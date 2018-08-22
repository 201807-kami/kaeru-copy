class Admin::AdminsController < ApplicationController
  layout 'admin'
  def index
    @admins = Admin.order(:id)
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(post_params)
    if @admin.save
      flash[:success] = '登録が完了しました'
      redirect_to admin_admins_path
    else
      flash.now[:error] = '入力内容をご確認ください'
      render :new
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    @admin.assign_attributes(post_params)
    if params[:admin][:password].present?
      # パスワード変更時
      @admin.password = params[:admin][:password]
      @admin.password_confirmation = params[:admin][:password_confirmation]
    end
    if @admin.save
      flash[:success] = '更新が完了しました'
      redirect_to admin_admins_path
    else
      flash.now[:error] = '入力内容をご確認ください'
      render :edit
    end
  end

  def destroy
    admin = Admin.find(params[:id])
    if admin.id == current_admin.id
      flash[:error] = '自アカウントを削除することはできません'
    else
      admin.destroy!
      flash[:success] = '削除が完了しました'
    end
    redirect_to admin_admins_path
  end

  private
  def post_params
    params.require(:admin).permit(:name, :email)
  end
end
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      @rand = rand(2000)
      @user[:activateCode] = @rand
      @user.save
      UserMailer.registration_confirmation(@user, @rand).deliver
      redirect_to root_url
    else
      render "new"
    end
  end

  def activate

    code = params[:code]
    id = params[:id]
    @user = User.find(id)

    if code == @user.activateCode.to_s then
      @user[:activateCode] = -1
      @user.save
    end

  end

end

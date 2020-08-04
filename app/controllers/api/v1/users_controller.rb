# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::BaseController
  def create
    @user = User.new(user_params)

    return render json: @user, status: :created if @user.save

    render json: @user.errors, status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit :email, :password
  end
end

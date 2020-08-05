# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::BaseController
  def create
    @user = User.new(user_params)

    return render_object(@user, status: :created) if @user.save

    render_errors(@user.errors)
  end

  private

  def user_params
    params.require(:user).permit :email, :password
  end
end

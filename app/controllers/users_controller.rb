class UsersController < ApplicationController
  def index
    p "X" * 40
    p params
    if params[:page]
      @users = User.by_karma.limit(50).offset((50 * params[:page].to_i) - 50)
    else
      p "Too big"
      @users = User.by_karma.limit(50)
    end

    @last_page = User.all.count / 50
    @current_page = params[:page].to_i
  end
end

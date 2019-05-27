class SessionsController < BaseController
  def new
  end

  def home
  end

  def profile
    if logged_in?
      @user = current_user
    else
      redirect_to root_url
    end
  end

  def user
    @user = User.find(1)
    render json: @user
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to sessions_profile_url(@user)
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def users
    if logged_in?
      @user = current_user
      @users = User.all.where("id NOT IN(?)", current_user.id)
    else
      redirect_to root_url
    end
  end
end

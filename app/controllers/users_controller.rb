class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    if current_user
      case current_user.credentials
      when 'hand'
        @msg = 'Ваша заявка на регистрацию находится на рассмотрении у модератора.'
      when 'accept'
        @msg = "Спасибо, #{current_user.username}, Ваша  заявка на  регистрацию успешно подтверждена  модератором,  добро пожаловать!"
      when 'reject'
        @msg = "К сожалению, #{current_user.username}, Ваша заявка  на  регистрацию отклонена из-за несоответствия  переданных  данных"
      when 'block'
        @msg = "#{current_user.username} Вас заблакироваали!"
      when 'social'
        @msg = "Добро  пожаловать, #{current_user.username},  вы  успешно авторизовались через соц сеть"
      when 'admin'
        @msg = "#{current_user.username} - прирожденный админ"
      else
        @msg = 'Пользователь не определен!'
      end
    else
      # redirect_to new_user_session_path
    end

  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users/:id
  def edit_event
    user = User.find( params[:id] )
    status = params[:status]
    current_time = Time.current

    user.update_columns(credentials: status, blocked_date: current_time)

    render json: { status: status, blocked_date: current_time }
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :phone, :address, :city, :file, :credentials, :nickname, :provider, :url)
    end
end

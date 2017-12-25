class UserController < ApplicationController
  def new

  end

  def create
    new_user = User.new
    new_user.login = params[:login]
    new_user.password_hash = params[:password].hash
    session_id = Random.new_seed.to_s
    new_user.session_id = session_id
    # и cookies корректно возвращается и устанавливается.
    cookies['session_id'] = session_id
    cookies['login'] = params[:login]
    if new_user.valid?
      new_user.save
      render status: 202, json: {
          message: "Successfully registred as #{new_user.login}."
      }.to_json
    else
      render status: 406, json: {
          message: 'Login is busy.'
      }.to_json
    end
  end

  # позволяет войти
  def login
    registered_user = User.find_by_login(params[:login])
    if registered_user and params[:password].hash.to_s == registered_user.password_hash
      session_id = Random.new_seed.to_s
      cookies['session_id'] = session_id
      cookies['login'] = params[:login]
      registered_user.session_id = session_id
      registered_user.save!

      # render status: 202, json: {
      #     message: "Successfully logged in as #{registered_user.login}."
      # }.to_json
      puts 'зарегистрировался'
      redirect_to '/'
    else
      cookies['session_id'] = ''
      cookies['login'] = ''
      render status: 406, json: {
          message: 'Wrong login or password.'
      }.to_json
      puts 'неверный логин или пароль'
    end
  end

  # удаляет сессию
  def departed_user
    registered_user = User.find_by_login(params[:login])
    if registered_user
      registered_user.session_id = NIL
      registered_user.save
    end
    cookies['session_id'] = ''
    cookies['login'] = ''
    redirect_to '/', status: 303
  end
end

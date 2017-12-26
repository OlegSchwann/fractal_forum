class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  def ApplicationController.is_login?(cookies)
      user = User.find_by_login(cookies[:login].to_s)
      if user != NIL and user.session_id == cookies[:session_id]
          # puts "#{user.login} вошёл"
          return TRUE
      else
          # puts 'неавторизированный запрос.'
          return FALSE
      end
  end
end

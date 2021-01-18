module ApplicationHelper
  def logged_in?
    session[:current_user_id] != nil
  end

  def require_login
    return if logged_in?

    flash[:error] = 'You must be logged in'
    redirect_to login_path
  end

  def display_login
    link_to('Login', login_path, class: 'nav-link') unless logged_in?
  end

  def display_sign_up
    link_to('Sign Up', new_user_path, class: 'nav-link') unless logged_in?
  end

  def display_username
    link_to user.username, user_path(session[:current_user_id]), class: 'nav-link' if logged_in?
  end

  def display_logout
    link_to 'Log Out', logout_path, method: :delete, class: 'nav-link' if logged_in?
  end

  def display_error(model)
    render partial: 'layouts/errors', locals: { model: model } if model.errors.any?
  end
end

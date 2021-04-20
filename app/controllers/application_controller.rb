# class ApplicationController < ActionController::Base
class ApplicationController < ActionController::Base
  include ActionController::ImplicitRender
  include ActionView::Layouts

  # This will be on the assessment
  protect_from_forgery with: :exception

  # make these methods available from within the views
  helper_method :current_person, :logged_in?

  def login!(person)
    # set the session_token for the connection to be the 
    session[:session_token] = person.session_token
    # response.headers['Set-Cookie'] += 'Secure;SameSite=None'
  end
  
  def logout!
    # Scramble the current_person's session_token
    current_person.reset_session_token!
    
    # Reset the session
    session[:session_token] = nil
    # response.headers['Set-Cookie'] += 'Secure;SameSite=None'
  end

  def current_person
    # Check for session_token
    return nil unless session[:session_token]

    # Return the person associated with the session_token (if token is valid)
    @current_person ||= Person.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !current_person.nil?
  end
  
  def require_logged_out
    # Prevent logged-in users from seeing certain pages
    redirect_to person_url(current_person) if logged_in?
  end

  def require_logged_in
    # Prevent logged-out users from seeing certain pages
    redirect_to new_session_url unless logged_in?
  end
end

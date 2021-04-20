class Api::SessionController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    # Find user by credentials
    @person = Person.find_by_credentials(params[:person][:email], params[:person][:password])
    if @person.nil?
      render json: ['Nope. Wrong credentials!'], status: 401
    else
      login!(@person)
      render 'api/people/show';
    end
  end

  def destroy
    logout!
    render json: { message: 'Logout successful.' }
  end
end
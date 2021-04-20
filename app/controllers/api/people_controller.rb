class Api::PeopleController < ApplicationController
  before_action :selected_person, only: [:guest, :manager, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  
  def loggedInPerson
    @person = current_person
    if @person
      @person = Person.includes(:bookings).find(@person.id)
      render :show
    else
      render json: ""
    end
  end

  def show
    @person = Person.includes(:bookings, :made_manager_ratings).find(params[:id])
  end  
  
  def create
    @person = Person.new(person_params)
    if @person.save
      login!(@person)
      render :show
    else
      render json: @person.errors.full_messages, status: 401
    end
  end
  
  def update
    if @person && @person.update_attributes(person_params)
      render :show
    elsif !@person
      render json: ['Could not locate person'], status: 400
    else
      render json: @person.errors.full_messages, status: 401
    end
  end
  
  def destroy
    if @person
      @person.destroy
      render :show
    else
      render ['Could not find person']
    end
  end
  
  private
  
  def selected_person
    @person = Person.find(params[:id])
  end
  
  def person_params
    params.require(:person).permit(:email, :password)
  end
end

class RaterController < ApplicationController
  
  def index
    @people = Person.all

    @current_person = @people.sample
  end
  
  def show
    @person = Person.find(params[:id])
  end
  
  def hot
    @person = Person.find(params[:format])
    @person.hot
    redirect_to(:action => 'index')
  end
  
  def not
    @person = Person.find(params[:format])
    @person.not
    redirect_to(:action => 'index')
  end
  
end

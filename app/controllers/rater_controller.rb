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
    @person.increment(:times_liked, by = 1)
    @person.increment(:times_rated, by = 1)
    @person.save
    redirect_to(:action => 'index')
  end
  
  def not
    @person = Person.find(params[:format])
    @person.increment(:times_rated, by = 1)
    @person.save
    redirect_to(:action => 'index')
  end
  
end

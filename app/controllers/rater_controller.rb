class RaterController < ApplicationController
  
  def index
    @people = Person.all
    
    offset = rand(@people.size)
    @current_person = Person.offset(offset).first
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
  
  private
  
  def person_params
    params.require(:person).permit(:name, :imageurl, :times_liked, :times_rated)
  end
  
end

class RaterController < ApplicationController
  
  def index
    @person = Person.all
  end
  
  def show
    @person = Person.find(params[:id])
  end
  
  def new
    @person = Person.new
  end
  
  def create
    @person = Person.new(person_params)
    @person.save
  end
  
  def edit
    @person = Person.find(params[:id])
  end
  
  def update
    @person = Person.find(params[:id])
    @person.update_attributes(person_params)
  end
  
  def delete
    @person = Person.find(params[:id])
  end
  
  def destroy
    Person.find(params[:id]).destroy
    redirect_to(:action => 'index')
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

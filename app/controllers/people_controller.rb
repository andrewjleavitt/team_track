class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
    @teams = Team.all
  end

  def edit
    @person = Person.find(params[:id])
    @teams = Team.all
  end

  def create
    Person.create(people_params)
    redirect_to(people_url)
  end

  def update
    @person = Person.find(params[:id])
    @person.update(people_params)
    redirect_to(@person)
  end

  private

  def people_params
    params.require(:person).permit(:name,)
  end
end

class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
    @teams = Team.all
  end

  def edit
    @member = Member.find(params[:id])
    @teams = Team.all
  end

  def create
    Member.create(member_params)
    redirect_to(members_url)
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to(@member)
  end

  private

  def member_params
    params.require(:member).permit(:name, :team_id)
  end

end

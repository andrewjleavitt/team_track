class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
    @teams = Plan.all.pluck(:team).uniq
  end

  def edit
    @member = Member.find(params[:id])
    @teams = Plan.all.pluck(:team).uniq
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
    params.require(:member).permit(:name, :team)
  end

end

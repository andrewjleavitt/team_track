class WeeklyPlanMailer < ApplicationMailer
  default from: 'notifications@weekly-team-planner.herokuapp.com'

  def send_plan
    @plans = Plan.current_plan
    mail(
      to: ENV['EMAIL_TO_ADDRESS'] || 'test@example.com',
      subject: 'The Plan for the Week'
    )
  end
end

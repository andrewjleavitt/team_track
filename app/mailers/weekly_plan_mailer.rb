class WeeklyPlanMailer < ApplicationMailer
  EMAIL_TO = Rails.env.production? ? APP_CONFIG[:email_address] : "test@example.com"
  default from: 'notifications@weekly-team-planner.herokuapp.com'

  def send_plan
    @plans = Plan.current_plan
    mail(
      to: EMAIL_TO,
      subject: 'The Plan for the Week'
    )
  end
end

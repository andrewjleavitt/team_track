class WeeklyPlanMailer < ApplicationMailer
  default from: 'notifications@mavenlink.com'

  def send_plan
    @plans = Plan.current_plan
    mail(
      to: 'aleavitt@mavenlink.com',
      subject: 'The Plan for the Week'
    )
  end
end

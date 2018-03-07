FactoryBot.define do
  factory :plan do
    team
    project
    week Date.today.beginning_of_week
  end
end

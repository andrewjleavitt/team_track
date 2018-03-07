FactoryBot.define do
  factory :project do
    name "World Peace"
    status "Yellow"
    due_at Date.today.beginning_of_week + 1.weeks
  end
end

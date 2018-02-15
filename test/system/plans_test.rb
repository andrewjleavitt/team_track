require "application_system_test_case"

class PlansTest < ApplicationSystemTestCase
  def setup
    Plan.create(
      team: "*MSYNC",
      project: "Vendor Expenses",
      project_due: "January 1, 1999",
      project_status: "Green"
    )

    Plan.create(
      team: "Rogue Squadron",
      project: "Time Off",
      project_due: "March 31, 2018",
      project_status: "Green"
    )
  end

  def teardown
    Plan.destroy_all
  end

  test "visiting the index" do
    visit plans_url

    assert_selector "h1", text: "Plans"
    assert_text "*MSYNC"
    assert_text "Vendor Expenses"
    assert_text "January 1, 1999"
    assert_text "Green"

    assert_text "Rogue Squadron"
    assert_text "Time Off"
    assert_text "March 31, 2018"
    assert_text "Green"
  end
end

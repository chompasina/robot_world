require_relative "../test_helper"

class UserCanCreateARobotTest < FeatureTest

  def test_user_can_create_a_robot
    # As a user
    # When I visit my root/home page
    visit "/"
    # And I click on the link "New robot"
    click_link "New Robot"
    # Then I should be on the new robots page
    assert_equal "/robots/new", current_path
    # And I fill in the title field with "new robot"
    fill_in "robot[name]", with: "Robotsina"
    # And I fill in the description field with "new description"
    fill_in "robot[city]", with: "Venice"
    # And I click the submit button
    fill_in "robot[state]", with: "FL"
    fill_in "robot[birthdate]", with: "06/01/1925"
    fill_in "robot[hire]", with: "04/21/2014"
    fill_in "robot[department]", with: "Eating berries"
    click_button("Submit")
    assert_equal "/robots", current_path
    # Then I should see the list of robots and an All robots header
    assert_equal '/robots', current_path
    assert page.has_css?("#name")
    assert page.has_content?("All robots")

  end
end

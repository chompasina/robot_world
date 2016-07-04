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
    fill_in "robot[title]", with: "new robot"
    # And I fill in the description field with "new description"
    fill_in "robot[description]", with: "new description"
    # And I click the submit button
    click_button("Submit")
    assert_equal "/robots", current_path
    # Then I should see the list of robots and an All robots header
    assert page.has_css?("#title")
    assert page.has_content?("All robots")

  end
end

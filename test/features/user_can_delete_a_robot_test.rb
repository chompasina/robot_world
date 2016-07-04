require_relative '../test_helper'

class UserDeletesARobotTest < FeatureTest
  def test_user_can_delete_a_robot
    robot1 = robot_directory.create({name: "Logan Metz", city: "Chicago", state: "IL", birthdate: "October 16, 1986", hire: "June 16, 1987", department: "Music"})

    robot2 = robot_directory.create({name: "Casey Metz", city: "Chicago", state: "IL", birthdate: "September 16, 1986", hire: "June 16, 1987", department: "Robots"})

    visit '/'
    click_link("Robot Directory")
    click_link("#{robot_directory.all.first.name}")
    click_button("Delete Robot")

    assert_equal "/robots", current_path
    assert page.has_content?("Casey Metz")
    refute page.has_content?("Logan Metz")
  end
end

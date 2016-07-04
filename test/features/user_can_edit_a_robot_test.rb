require_relative '../test_helper'

class UserCanEditARobotTest < FeatureTest
  def test_user_can_edit_a_robot
    robot1 = robot_directory.create({name: "Logan Metz", city: "Chicago", state: "IL", birthdate: "October 16, 1986", hire: "June 16, 1987", department: "Music"})

    robot2 = robot_directory.create({name: "Casey Metz", city: "Chicago", state: "IL", birthdate: "September 16, 1986", hire: "June 16, 1987", department: "Robots"})


    visit '/'
    click_link("Robot Directory")
    click_link("#{robot_directory.all.first.name}")
    click_link("Edit")

    assert_equal "/robots/#{robot_directory.all.first.id}/edit", current_path

    fill_in "robot[name]", with: "Princess Leah"
    fill_in "robot[city]", with: "Orlando"
    fill_in "robot[state]", with: "FL"
    fill_in "robot[birthdate]", with: "03/30/2000"
    fill_in "robot[date_hired]", with: "02/01/2010"
    fill_in "robot[department]", with: "Pie Making"
    click_button("Edit")

    assert_equal "/robots/#{robot_directory.all.first.id}", current_path
    assert page.has_content?("Pie Making")
    refute page.has_content?("Princess Leah")
  end
end

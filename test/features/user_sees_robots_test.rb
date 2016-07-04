require_relative '../test_helper'

class UserSeesRobotsTest < FeatureTest
#different inheritance chain. we've defined feature test in the test helper, and that inherits from minitest so we're still getting from minitest, plus whatever else we write in feature test

  def test_user_sees_index_of_robots
    robot1 = robot_directory.create({name: "Logan Metz", city: "Chicago", state: "IL", birthdate: "October 16, 1986", hire: "June 16, 1987", department: "Music"})

    robot2 = robot_directory.create({name: "Casey Metz", city: "Chicago", state: "IL", birthdate: "September 16, 1986", hire: "June 16, 1987", department: "Robots"})

    ###write user stories here###
    #As a user
    #When I visit the robots index
    visit "/robots"

    #then I should see a list of my robots and their titles
    within("#robot_list") do
    assert page.has_content?("Music")
    assert page.has_content?("Robots")
  end
end
end

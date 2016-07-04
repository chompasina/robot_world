require_relative '../test_helper'

class RobotTest < Minitest::Test

  def test_assigns_attributes_correctly
    #want it to test that it has the right id, title, and description
    robot = Robot.new({"id" => "11", "name" => "Dr. Tyrel Witting", "city" => "Dickensshire", "state" => "KY", "birthdate" => "2016-03-27", "date hired" => "2016-06-16", "department" => "Jewelry"})
    assert_equal "11", robot.id
    assert_equal "Dr. Tyrel Witting", robot.name
    assert_equal "Dickensshire", robot.city
    assert_equal "at 4 PM", robot.state
    assert_equal "2016-03-27", robot.birthdate
    assert_equal "2016-06-16", robot.hire
    assert_equal "Jewelry", robot.department
  end
end

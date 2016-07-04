require_relative '../test_helper'

class RobotDirectoryTest < Minitest::Test
  include TestHelpers

  # def current_robot_id
  #   robot_directory.all.first.id
  # end

  def test_it_creates_a_robot
    assert_equal 0, robot_directory.all.count

    robot_directory.create({name: "Casey Metz", city: "Denver", state: "CO", birthdate: "September 16, 1984", hire: "June 16, 1987", department: "Coding"})

    assert_equal 1, robot_directory.all.count

    robot = robot_directory.find(robot_directory.all.count)

    assert_equal "Casey Metz", robot.name
    assert_equal "Denver", robot.city
    assert_equal "CO", robot.state
    assert_equal "September 16, 1984", robot.birthdate
    assert_equal "June 16, 2016", robot.hire
    assert_equal "Coding", robot.department
    assert_instance_of Robot, robot
  end

  def test_that_all_returns_entered_robots
    assert_equal [], robot_directory.all

    robot_directory.create({name: "Casey Metz", city: "Denver", state: "CO", birthdate: "September 16, 1984", hire: "June 16, 1987", department: "Coding"})
    assert_equal 1, robot_directory.all.count
    assert_equal "Casey Metz", robot_directory.all[0].name

    robot_directory.create({name: "Logan Metz", city: "Chicago", state: "IL", birthdate: "October 16, 1986", hire: "June 16, 1987", department: "Music"})
    assert_equal 2, robot_directory.all.count
    assert_equal "Logan Metz", robot_directory.all[1].name

    names = []
    robot_directory.all.map do |name|
      names << name.name
    end

    assert_equal ["Casey Metz", "Logan Metz"], names
  end

  def test_that_it_finds_robots_in_database
    robot_directory.create({name: "Casey Metz", city: "Denver", state: "CO", birthdate: "September 16, 1984", hire: "June 16, 1987", department: "Coding"})
    assert_equal 1, robot_directory.find(1).id

    robot_directory.create({name: "Logan Metz", city: "Chicago", state: "IL", birthdate: "October 16, 1986", hire: "June 16, 1987", department: "Music"})
    assert_equal 2, robot_directory.find(2).id
  end

  def test_that_robots_are_updated
    robot_directory.create({name: "Logan Metz", city: "Chicago", state: "IL", birthdate: "October 16, 1986", hire: "June 16, 1987", department: "Music"})

    robot_directory.update(1, {name: "Logan Metz", city: "Chicago", state: "IL", birthdate: "August 7, 1987", hire: "June 16, 1987", department: "Music"})

    assert_equal "August 7, 1987", robot_directory.find(1).birthdate
    assert_equal "Chicago", robot_directory.find(1).city

    robot_directory.create({name: "Casey Metz", city: "Denver", state: "CO", birthdate: "September 16, 1984", hire: "June 16, 1987", department: "Coding"})

    robot_directory.update({name: "Trevor Metz", city: "Milwaukee", state: "WI", birthdate: "January 28, 1990", hire: "June 16, 1987", department: "Football"})

    assert_equal ["Trevor Metz", "Milwaukee"], [robot_directory.find(2).name, robot_directory.find(2).city]
  end

  def test_that_it_deletes_all
    assert_equal 0, robot_directory.all.count
    robot_directory.create({name: "Logan Metz", city: "Chicago", state: "IL", birthdate: "October 16, 1986", hire: "June 16, 1987", department: "Music"})
    robot_directory.create({name: "Trevor Metz", city: "Milwaukee", state: "WI", birthdate: "January 28, 1990", hire: "June 16, 1987", department: "Football"})
    robot_directory.create({name: "Casey Metz", city: "Denver", state: "CO", birthdate: "September 16, 1984", hire: "June 16, 1987", department: "Coding"})
    assert_equal 3, robot_directory.all.count
    robot_directory.destroy(2)
    assert_equal 2, robot_directory.all.count
    robot_directory.delete_all
    assert_equal 0, robot_directory.all.count
  end
end

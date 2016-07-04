require_relative 'robot_directory'
require 'faker'
require 'sqlite3'

class Seed

  def self.run
    robot_directory.seeding_database
  end

  def self.robot_directory
    database = SQLite3::Database.new("db/robot_directory_development.db")
    RobotDirectory.new(database)
  end

end


Seed.run

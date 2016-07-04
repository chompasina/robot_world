require 'faker'

class RobotDirectory
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.execute("INSERT INTO robots (name, city, state, birthdate, hire, department) VALUES (?, ?, ?, ?, ?, ?);", robot[:name], robot[:city], robot[:state], robot[:birthdate], robot[:hire], robot[:department]  )
  end

  def seeding_database
    100.times do
      params = { :name => Faker::Name.name, :city => Faker::Address.city, :state => Faker::Address.state_abbr, :birthdate => Faker::Date.backward(16000).strftime('%m/%d/%Y'), :hire => Faker::Date.backward(10000).strftime('%m/%d/%Y'), :department => Faker::Commerce.department }
      create(params)
      puts "Created robot #{params[:name]}"
    end
  end

  def raw_robots
    database.execute("SELECT * FROM robots;")
  end

  def all
    raw_robots.map { |data| Robot.new(data)
    }
  end

  def raw_robot(id)
    database.execute("SELECT * FROM robots WHERE id = ?;", id).first
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot)
    database.execute("UPDATE robots SET name= ?, city= ?, state= ?, birthdate= ?, hire= ?, department=? WHERE id = ?;", robot[:name], robot[:city], robot[:state], robot[:birthdate], robot[:hire], robot[:department], id )
  end

  def destroy(id)
    database.execute("DELETE FROM robots WHERE id = ?;", id)
  end

  def delete_all
    database.execute("DELETE FROM robots;")
  end

  # def birthdates
  #   birthdates = database.execute("SELECT birthdate FROM robots;")
  #   split_dates = birthdates.flatten
  #     @dates = split_dates.collect! do |date|
  #       date.split('/')
  #     end
  # end
  #
  # def birthyears
  #   just_years = @dates.collect! do |single_year|
  #     single_year[2]
  #   end
  #   @final_birth = just_years.flatten
  # end

  #   year_now = Time.now.utc.to_date.year
  #   age = @final_birth.collect! do |birthyear|
  #     year_now - birthyear.to_i
  #   end
  #   age.flatten
  #   @avg_age = age.reduce(:+)/age.count
  # # end
  def average_age

    birthyears = all.map do |robot|
      Time.now.year - Time.new(robot.birthdate).year
      require "pry"; binding.pry
    end
    sum_of_ages = birthyears.reduce(:+)
    average = sum_of_ages / birthyears.count
    average
  end
  #
  # def year_hired
  #   each_year = {}
  #   hire_years = all.map do |robot|
  #     Time.new(robot.hire.year).year
  #   end.sort
  #   hire_years.each do |year|
  #     each_year[year] += 1
  #   end
  #   each_year
  # end
  #
  # def city
  #   each_city = {}
  #   cities = all.map do |robot|
  #     robot.city
  #   end.sort
  #   cities.each do |city|
  #     each_city[city] += 1
  #   end
  #   each_city
  # end
  #
  # def state
  #   each_state = {}
  #   states= all.map do |robot|
  #     robot.state
  #   end.sort
  #   states.each do |state|
  #     each_state[state] += 1
  #   end
  #   each_state
  # end
  #
  # def department
  #   each_department = {}
  #   departments = all.map do |robot|
  #     robot.department
  #   end.sort
  #   departments.each do |department|
  #     each_department[department] += 1
  #   end
  #   each_department
  # end



  #   hire_dates = database.execute("SELECT hire FROM robots;")
  #   split_hires = hire_dates.flatten
  #     @hire_years = split_hires.collect! do |date|
  #       date.split('/')
  #     end
  # end
  #
  # def hires_by_year
  #   just_years = @hire_years.collect! do |single_year|
  #     single_year[2]
  #   end
  #   @hires = just_years.flatten
  # end
  #
  # def hire_breakdown
  #   @hires.to_s
  #   hash = years.group_by do |year, count|
  #     year
  #   end
  #    hash.group_by do |key, value|
  #     puts "#{key} => #{value.count}"
  #     @hires_by_year = _
  #   end



  #average age, breakdown of how many robots were hired each year, and number of robots in each department/city/state.
  #
  # def number_per_year
  #   less the uniq years
  #

end



# def average_age
# average = Time.now.year -database[:robots].avg(:birthdate)
#   # avg.to_i
# end

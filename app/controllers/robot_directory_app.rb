# require 'models/robot_directory'
require 'sqlite3'

class RobotDirectoryApp < Sinatra::Base

  get '/' do
    @robots = robot_directory.all
    @average = robot_directory.average_age unless robot_directory.all.size == 0
    #won't set the instance variable if it's nil (falsey)
    # @by_year = robot_directory.year_hired
    # @by_department = robot_directory.department
    # @by_city = robot_directory.city
    # @by_state = robot_directory.state

    erb :dashboard
  end

  get '/robots' do
    @robots = robot_directory.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot_directory.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id/edit' do |id|
    @robot = robot_directory.find(id.to_i)
    erb :edit
  end

  get '/robots/:id' do |id|
    @robot = robot_directory.find(id.to_i)
    erb :show
  end

  put '/robots/:id' do |id|
    robot_directory.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    robot_directory.destroy(id.to_i)
    redirect '/robots'
  end

  def robot_directory
    if ENV['RACK_ENV'] == "test"
      database = SQLite3::Database.new("db/robot_directory_test.db")
    else
    database = SQLite3::Database.new("db/robot_directory_development.db")
  end
    database.results_as_hash = true
    @robot_directory ||= RobotDirectory.new(database)
  end

  not_found do
    erb :error
  end


end

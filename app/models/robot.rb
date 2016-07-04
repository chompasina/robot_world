class Robot
  attr_reader :name,
              :city,
              :id,
              :state,
              :birthdate,
              :hire,
              :department

  def initialize(data)
    @id         = data["id"]
    @name       = data["name"]
    @city       = data["city"]
    @state      = data["state"]
    @birthdate  = data["birthdate"]
    @hire       = data["date_hired"]
    @department = data["department"]
  end
end

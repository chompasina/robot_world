require 'sqlite3'

database = SQLite3::Database.new("db/robot_directory_development.db")

database.execute("DELETE FROM robots;")
# If we ever run file accidentally, we'll start from scratch- helps keep us organized. prevents possible problems in the future.

database.execute("INSERT INTO robots (name, city, state, birthdate, hire, department) VALUES ('Casey Metz', 'Denver', 'CO', 'September 16, 1984', 'June 16, 1987', 'Front End')")

p database.execute("SELECT * FROM robots;")

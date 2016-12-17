# Enter type of event
# Enter type of project for the event
# Enter due date of project
# Enter date of event
# User pull up the application and it checks the date now
# Pulls up by month
# What is over due ? (optioal/unlikely)
# What to do
# What has been done
# What events are happening

# require gems
require 'sqlite3'
require 'faker'
require 'date'
#require 'pry'

# will need Faker::Date, Faker::Boolean, Faker::Name?
# need to create a database
db = SQLite3::Database.new("planner.db")
#db.results_as_hash = true

#first table needed
create_events_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS events(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    type_of_event VARCHAR(255),
    date_of_event DATETIME,
    has_happened BOOLEAN
  )
SQL

# I thought I was going to need this in the above table, but I'm not sure now:
# project_id (INT),
# FOREIGN KEY (project_id) REFERENCES projects(id)

#second table needed
create_projects_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS projects(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    type_of_project VARCHAR(255),
    due_date DATETIME,
    date_to_start DATETIME,
    is_done BOOLEAN,
    event_id INT,
    FOREIGN KEY (event_id) REFERENCES events(id)
  )
SQL

# create a kittens table (if it's not there already)
db.execute(create_events_table_cmd)
db.execute(create_projects_table_cmd)
#methods for entering info
def create_event(db, name, type, date, happened)
  db.execute("INSERT INTO events (name, type_of_event, date_of_event, has_happened) VALUES (?, ?, ?, ?)", [name, type, date, happened])
end

def create_project(db, name, type, due, start, done, event_id)
db.execute("INSERT INTO projects (name, type_of_project, due_date, date_to_start, is_done, event_id) VALUES (?, ?, ?, ?, ?, ?)", [name, type, due, start, done, event_id])
end

def mark_done(db, id)
  db.execute("UPDATE projects SET is_done='true' WHERE id = ?", [id])
end

#querrying
def what_events(db)
  db.execute("SELECT events.name, events.date_of_event FROM events;")
end

def what_projects(db)
  db.execute("SELECT projects.name, projects.due_date FROM projects;")
end

def what_to_do(db)
  db.execute("SELECT events.name, events.date_of_event, projects.name FROM projects JOIN events ON projects.event_id = events.id;")
end

def when_to_start(db)
  db.execute("SELECT events.name, projects.name, projects.date_to_start FROM projects JOIN events ON projects.event_id = events.id WHERE is_done = 'false';")
end


# kittens = db.execute("SELECT * FROM kittens")
# kittens.each do |kitten|
#  puts "#{kitten['name']} is #{kitten['age']}"
# end

# create_event(db, 'Christmas2016', 'seasonal', '2016-12-25', 'false')
# create_project(db, 'scarf', 'knitting', '2016-12-25', '2016-10-1', 'false', 1)
# mark_done(db, 1)
# puts what_events(db)
# puts what_projects(db)
# puts what_to_do(db)
# puts when_to_start(db)

puts ""







#Compute the current date.
#SELECT date('now');
# my_time = Time.new(some_sql_retrieval_of_a_time)
# my_time.strftime("at %I:%M%p")
#driver code
# ask for name, type, date of event
  # convert into exacutiable sqlite3 commands
# ask for name, type, due date of project,
  # convert into exicutible sqlite3 commands
# ask for expected length of time required to finish it (suggest adding another 3rd the time on because good idea)
  # calculate when to start project and enter it into the date_to_start column
# allow user to update the status of project finished
# when done entering info
# show what projects need started this month
# show projects that have not been completed, but the due date hasn't passed
# show what events are happening this month.

# 3 main steps
# get info from user
# put info in database
# querry database for info

# response = some_sql_query
# p response

# irb(main):006:0> Date.new(2001,2,3)
# => #<Date: 2001-02-03 ((2451944j,0s,0n),+0s,2299161j)>
# irb(main):007:0> date = _
# => #<Date: 2001-02-03 ((2451944j,0s,0n),+0s,2299161j)>
# irb(main):008:0> date.iso8601
# => "2001-02-03"
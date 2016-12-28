# require gems
require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

db.execute(<<-SQL
  CREATE TABLE IF NOT EXISTS campuses(
    id INTEGER PRIMARY KEY,
    city VARCHAR(255)
  )
SQL
)

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  @campuses = db.execute("SELECT * FROM campuses")
  erb :new_home
end

get '/students/new' do
  erb :new_student
end

get '/campuses/new' do
  erb :campuses
end
# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

post '/campuses' do
  db.execute("INSERT INTO campuses (city) VALUES (?)", [params['city']])
  redirect '/'
end

# add static resources

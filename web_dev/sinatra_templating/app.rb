# require gems
require 'sinatra'
require 'sqlite3'
require 'sinatra/reloader' if development?

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  #@campuses = db.execute("SELECT * FROM campus")
  erb :home
end

get '/students/new' do
  erb :new_student
end

get '/info' do
  @campus_info = db.execute("select campus, round(avg(age),1) avg_age, count(*) counts from students group by campus")
  @campuses = db.execute("select * from campus")
  erb :info
end

get '/campus/new' do
  erb :campus
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

#insert new campus
post '/campus' do
  db.execute("INSERT INTO campus (campus_code, campus_name) VALUES (?,?)", [params['campus_code'], params['campus_name']])
  redirect '/'
end

# add static resources
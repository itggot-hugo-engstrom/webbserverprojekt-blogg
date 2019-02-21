require 'sinatra'
require 'slim'
require 'SQLite3'
require 'bcrypt'


get ('/') do
    slim(:index)
end

post('/login') do 
    db = SQLite3::Database.new("db/blogg.db")
    db.results_as_hash = true

    result = db.execute("SELECT username,password FROM tabell WHERE tabell.username=(?)",params["username"], params["password"])
    new = result[0]
    if params["username"] == new[0] && BCrypt::Password.new(hash_password) == new[1]
        redirect('/logged')
    else
        redirect('/oops')
    end
end

post('/register') do
    db = SQLite3::Database.new("db/blogg.db")
    hash_password = BCrypt::Password.create(params["password"])
    db.execute('INSERT INTO tabell(username, password) VALUES ((?), (?))', params["username"], hash_password)
    redirect('/')
end

get ('/oops') do
    slim(:index)
end

get ('/register') do
    slim(:register)
end

post '/test' do
    session[:username] = params["username"]
    session[:password] = params["password"]
    redirect('/')
end
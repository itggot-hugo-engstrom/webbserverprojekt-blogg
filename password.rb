require 'bcrypt'

def run()

    password = "abc123"
    p hashat_password = BCrypt::Password.create(password) #=> "$2a$10$e2JzstC5MGSAUy9RcJGGTOQ1OHnGFd.Z8lRqlr2lXmBTUWLbrIJyC"

end

p run()
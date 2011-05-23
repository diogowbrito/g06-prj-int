class User < ActiveRecord::Base
  attr_accessible :userName, :email, :password, :password_confirmation

    attr_accessor :password
    before_save :encrypt_password

    validates_confirmation_of :password
    validates_presence_of :password, :on => :create
    validates_presence_of :userName
    validates_uniqueness_of :userName
    validates_presence_of :email
    validates_uniqueness_of :email

    def self.authenticate(username, password)
      user = find_by_userName(username)
      if user && user.passwordHash == BCrypt::Engine.hash_secret(password, user.passwordSalt)
        user
      else
        nil
      end
    end

    def encrypt_password
      if password.present?
        self.passwordSalt = BCrypt::Engine.generate_salt
        self.passwordHash = BCrypt::Engine.hash_secret(password, passwordSalt)
      end
    end

end

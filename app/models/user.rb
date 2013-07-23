require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  def generate_token
    self.token_created_at = DateTime.now
    self.token_updated_at = DateTime.now
    self.token = Base64.encode64(OpenSSL::Random.random_bytes(48)).slice(8, 32) +
      Base64.encode64(OpenSSL::Random.random_bytes(48)).slice(8, 32)  
    self.save
    self.token  
  end
  
  def self.from_token(tok)
    u = User.find_by_token(tok)
    if !u.nil?
      if u.token_created_at < DateTime.now - 24.hours || u.token_updated_at < DateTime.now - 1.hour
        u = nil
      end
      u.token_updated_at = DateTime.now
    end
    u
  end
  
  def password=(pass)
    @password = Password.create pass
    self.password_hash = @password    
  end
  
  def password  
    @password ||= Password.new(self.password_hash)
  end
  
  def self.authenticate(username, password)
    u = self.where(:name => username).first
    if !u.nil?
      if u.password != password
        u = nil
      end
    end
    u
  end
  
  def data=(dat)
    self.json_data = dat.to_json
  end
  
  def data
    JSON.parse self.json_data
  end
  
end

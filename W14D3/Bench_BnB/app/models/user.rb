class User < ApplicationRecord
  #SSPIRE

  def self.find_by_credentials(username, password)
    user = User.find(username: username)
    user && user.is_password?(password) ? user : nil
  end

  def self.reset_session_token!
    
  end
end
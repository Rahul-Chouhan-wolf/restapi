class User
    
    include Mongoid::Document
    
    field :username, type: String
    field :email, type: String
    field :password, type: String

    validates :username , :email , presence: {message: "Must be given please..."}
    validates :password , length: {in: 7..15}
    
end
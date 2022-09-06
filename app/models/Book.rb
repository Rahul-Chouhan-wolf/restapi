class Book 
    
    include Mongoid::Document
    
    field :Title, type: String
    field :desc, type: String
    field :price, type: Numeric

end
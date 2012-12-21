class Product < ActiveRecord::Base
  attr_accessible :name
  
  has_many :quotes
  
  validates :name, :presence => true, :uniqueness => true 
end

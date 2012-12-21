class Quote < ActiveRecord::Base
  attr_accessible :price, :quantity
  
  belongs_to :product
  belongs_to :vendor
  
  validates :price, :presence => true
  validates :quantity, :presence => true
end

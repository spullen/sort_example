class Quote < ActiveRecord::Base
  attr_accessible :price, :quantity
  
  belongs_to :product
  belongs_to :vendor
  
  validates :price, :presence => true
  validates :quantity, :presence => true
  
  delegate :name, :to => :vendor, :prefix => true
  delegate :name, :to => :product, :prefix => true

  sortable :price        => {:column_name => :price, :default => 'ASC'},
           :quantity     => {:column_name => :quantity},
           :vendor_name  => {:column_name => :name, :joins => :vendor},
           :product_name => {:column_name => :name, :joins => :product}
  
end

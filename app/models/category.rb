class Category < ActiveRecord::Base
  attr_accessible :category
  has_many :foods
end

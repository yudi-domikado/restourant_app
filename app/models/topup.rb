class Topup < ActiveRecord::Base
	belongs_to :user
  attr_accessible :credit, :topup_date, :user_id
  validates_numericality_of :credit, :only_integer =>true, 
                            :greater_than_or_equal_to =>0, 
                             message: "number is less than zero.please input it again"

end

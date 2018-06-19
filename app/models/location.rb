class Location < ActiveRecord::Base
  belongs_to :resturant
  attr_accessible :address, :location
end

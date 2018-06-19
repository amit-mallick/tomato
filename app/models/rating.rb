class Rating < ActiveRecord::Base
  belongs_to :resturant
  attr_accessible :body, :commenter, :rating, :ratings
end

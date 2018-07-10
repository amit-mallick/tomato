class Resturant < ActiveRecord::Base
  attr_accessible :description, :image, :name, :remove_image, :cuisines, :average_rating, :user_id, :price, :location
  mount_uploader :image, ImageUploader
  validates :name, :presence => true
  validates_processing_of :image
  validate :image_size_validation

  has_many :ratings, :dependent => :destroy

  def average_rating
    self.ratings.average(:rating)
  end

  private

  def image_size_validation
    errors[:image] << "should be less than 5 MB" if image.size > 5.0.megabytes
  end

end

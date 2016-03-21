Spree::User.class_eval do

  has_many :like_boxes, :through => :likes, :class_name => "Dish::Box"

end

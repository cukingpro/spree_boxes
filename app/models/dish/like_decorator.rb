Dish::Like.class_eval do

  belongs_to :like_boxes, :class_name => "Dish::Boxes" , foreign_key: "box_id"

end

Dish::Like.class_eval do

  belongs_to :like_boxes, :class_name => "Dish::Box" , foreign_key: "box_id"

end

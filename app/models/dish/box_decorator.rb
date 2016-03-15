Dish::Box.class_eval do
  def self.create_most_liked_box(date)
    box = self.new(name: "Most liked box of #{date}")
    box.products = [Dish::DishType.main.most_liked_of_date(date) ,
                    Dish::DishType.soup.most_liked_of_date(date) ,
                    Dish::DishType.vegetable.most_liked_of_date(date)]
    # box.products = [Dish::DishType.main_most_like
    #               ]
    # box.save
    return box
  end

  def approved_comments
    Dish::Comment.where(box_id: self.id, status: 1).order(updated_at: :desc)
  end 
end

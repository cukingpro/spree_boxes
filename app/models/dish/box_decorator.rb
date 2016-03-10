Dish::Box.class_eval do
  def self.create_most_liked_box
    box = self.find_or_initialize_by(name: "Most liked box of #{Date.today}")
    box.products = [Dish::DishType.main_most_like,
    				Dish::DishType.soup_most_like,
    				Dish::DishType.vegetable_most_like]
    # box.products = [Dish::DishType.main_most_like
    # 				]				
    box.save
  end
end

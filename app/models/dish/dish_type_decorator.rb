Dish::DishType.class_eval do

  def self.main
    Dish::DishType.find_by(name: "Main")
  end

  def self.soup
    Dish::DishType.find_by(name: "Soup")
  end

  def self.vegetable
    Dish::DishType.find_by(name: "Vegetable")
  end

  def products_of_date(date)
  	self.products.select{|p| p.available_ons.any? {|d| d.delivery_date == date}}
  end

  # def self.main_of_date(date)
  #   self.main.products.select{|p| p.available_ons.any? {|d| d.delivery_date == date}}
  # end

  # def self.soup_of_date(date)
  #   self.soup.products.select{|p| p.available_ons.any? {|d| d.delivery_date == date}}
  # end

  # def self.vegetable_of_date(date)
  # 	self.vegetable.products.select{|p| p.available_ons.any? {|d| d.delivery_date == date}}
  # end


  def self.most_liked(products)
  	products.max_by{|p| p.likes.count}
  end

  def most_liked_of_date(date)
  	Dish::DishType.most_liked(self.products_of_date(date))
  end






end

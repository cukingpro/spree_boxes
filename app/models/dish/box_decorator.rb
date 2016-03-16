Dish::Box.class_eval do

  has_many :likes, :class_name => "Dish::Like", foreign_key: 'box_id'
  has_many :users, :through => :likes, :class_name => "Spree::User"

  accepts_nested_attributes_for :likes,
    :reject_if => :all_blank,
    :allow_destroy => true
  accepts_nested_attributes_for :users

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

  def current_user_like?(user_id)
    return false if user_id.blank?
    self.likes.pluck(:user_id).include?(user_id)
  end

end

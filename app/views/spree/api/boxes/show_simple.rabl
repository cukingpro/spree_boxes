object @box

attributes :id, :name, :descriptions
attributes :is_active => :type
node(:likes) { |b| b.likes.count }
node(:current_user_like){ |p| p.current_user_like?(@current_user_id) }
child(:images => :images) { extends "spree/api/boxes/image" }
#child(:approved_comments => :comments) { extends "spree/api/comments/show" }
child(@box.box_product_date(@date) => :delivery) do 
	node() { | delivery_product| 
		node(:date) { delivery_product[:date] }
		child(delivery_product[:products] => :products) { extends "spree/api/products/show_simple"}
	}
end

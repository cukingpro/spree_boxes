object @image
attributes :id
Dish::BoxImage.attachment_definitions[:attachment][:styles].each do |k,v|
	node("#{k}_url") { |i| i.attachment.url(k) }
end
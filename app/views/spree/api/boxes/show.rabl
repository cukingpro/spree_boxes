object @box

attributes :id, :name, :descriptions
object @dish_type
attributes :id, :name, :description, :is_active
child(:images => :images) { extends "spree/api/boxes/image" }
child(:products => :products){extends "spree/api/products/show"}
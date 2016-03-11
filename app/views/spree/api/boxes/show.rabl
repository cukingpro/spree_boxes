object @box

attributes :id, :name, :descriptions
child(:images => :images) { extends "spree/api/dish_types/image" }
child(:products => :products){extends "spree/api/products/show"}
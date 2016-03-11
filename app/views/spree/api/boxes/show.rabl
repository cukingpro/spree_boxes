object @box

attributes :id, :name, :descriptions
child(:images => :images) { extends "spree/api/boxes/image" }
child(:products => :products){extends "spree/api/products/show"}
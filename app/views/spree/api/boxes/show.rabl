object @box

attributes :id, :name, :descriptions
child(:variant_images => :images) { extends "spree/api/images/show" }
child(:products => :products){extends "spree/api/products/show"}
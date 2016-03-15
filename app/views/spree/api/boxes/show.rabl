object @box

attributes :id, :name, :descriptions
child(:images => :images) { extends "spree/api/boxes/image" }
child(:approved_comments => :comments) { extends "spree/api/comments/show" }
child(:products => :products){ extends "spree/api/products/show" }
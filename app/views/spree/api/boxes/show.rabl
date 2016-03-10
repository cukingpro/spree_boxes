object @box

attributes :id, :name, :descriptions
child(:products){extends "spree/api/products/show"}
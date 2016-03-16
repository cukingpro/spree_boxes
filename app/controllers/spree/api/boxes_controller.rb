module Spree
  module Api
    class BoxesController < Spree::Api::BaseController

      skip_before_action :authenticate_user

      def index
        @boxes = Dish::Box.all
        render "spree/api/boxes/index"
      end

      def show
        @box = Dish::Box.find(params[:id])
        render "spree/api/boxes/show"
      end

      def most_liked_box
        @box = Dish::Box.create_most_liked_box(Date.parse(params[:date]))
        render "spree/api/boxes/show"
      end

    end
  end
end

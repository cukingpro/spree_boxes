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


    end
  end
end

module Spree
  module Api
    class BoxesController < Spree::Api::BaseController

      skip_before_action :authenticate_user

      def index
        @boxes = Dish::Box.all
        render "spree/api/boxes/index"
      end

      def show
        @date = params[:date] ? Date.parse(params[:date]) : nil
        @box = Dish::Box.find(params[:id])
        @type= @box.is_active
        if @box.is_active
          render "spree/api/boxes/show2"
        else
          render "spree/api/boxes/show"
        end
      end

      def most_liked_box
        @box = Dish::Box.create_most_liked_box(Date.parse(params[:date]))
        render "spree/api/boxes/show"
      end

      def box_on_date
        @box = Dish::Box.find(params[:id])
        @date = Date.parse(params[:date])
        render "spree/api/boxes/show2"
      end

      def daily_box
        @box = Dish::Box.find_by(is_active: true)
        @date_from = params[:date_from] ? Date.parse(params[:date_from]) : nil
        @date_to = params[:date_to] ? Date.parse(params[:date_to]) : nil
        @date = params[:date] ? Date.parse(params[:date]) : nil
        render "spree/api/boxes/show_simple" if @date_from
        render "spree/api/boxes/show2" if @date
      end

      def weekly_box
        @box = Dish::Box.find_by(is_active: false)
        @date_from = params[:date_from] ? Date.parse(params[:date_from]) : nil
        @date_to = params[:date_to] ? Date.parse(params[:date_to]) : nil
        @date = params[:date] ? Date.parse(params[:date]) : nil
        render "spree/api/boxes/show_simple" if @date_from
        render "spree/api/boxes/show2" if @date
      end



    end
  end
end

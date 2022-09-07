class PlantsController < ApplicationController
    def index
        plants = Plant.all
        render json: plants
    end
    def show
        plant = Plant.find_by(id: params[:id])
        render json: plant
    end
    def create
        plant = Plant.new(
            name: params[:name],
            image: params[:image],
            price: params[:price]
        )
        if plant.save
            render json: plant, status: 201
        else
            render json: plant.errors.full_messages, status: 422
        end

    end
end

class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid

    def index
        render json: Camper.all 
    end 

    def show 
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperactivitySerializer, status: :ok 
    end 

    def create 
        camper = Camper.create!(camper_params)
        render json: camper, status: :created 
    end 

    private 
    def camper_params
        params.permit(:id, :name, :age)
    end 

    def not_found
        render json: {
            "error": "Camper not found"
        }, status: :not_found
    end 

    def invalid(error)
        render json: {
            errors: error.record.errors.full_messages
        }, status: 422 
    end 
end

class BindersController < ApplicationController
    def index
        render json: Binder.all
    end

    def show
        render json: Binder.find(params[:id])
    end

    def binder_item
        binders = Binder.where(
            Binder.arel_table[:name]
               .lower
               .matches(params[:binderName].downcase)
        )
        render json: binders
    end

    def create
        binder = Binder.create(binder_params)
        if binder.valid?
            render json: binder
        else
            render json: {errors: binder.errors.full_messages}
        end
    end

    def update
        binder = Binder.find(params[:id])
        binder.update(update_params)
        render json: binder
    end

    def destroy
        binder = Binder.find(params[:id])
        binder.destroy
    end

    private

    def binder_params
        params.permit(:user_id, :name)
    end

    def update_params
        params.permit(:name)
    end
end

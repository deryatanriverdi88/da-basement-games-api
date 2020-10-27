class FavoriteCardsController < ApplicationController
    def index
        favorite_cards = FavoriteCard.all.alphabetical
        render json: favorite_cards
    end

    def cards
        favorite_cards = []
        if params[:rarity]
            favorite_cards = FavoriteCard.where(
                FavoriteCard.arel_table[:rarity]
                   .lower
                   .matches("%" + params[:rarity].downcase + "%")
            )
        elsif params[:setName]
            favorite_cards = FavoriteCard.where(
                FavoriteCard.arel_table[:group_name]
                   .lower
                   .matches("%" + params[:setName].downcase + "%")
            )
        end
        render json: favorite_cards
    end

    def show
        favorite_card = FavoriteCard.find(params[:id])
        render json: favorite_card
    end

    def create
        favorite_card = FavoriteCard.create(favorite_card_params)
        if favorite_card.valid?
            render json: favorite_card
        else
            render json: {errors: favorite_card.errors.full_messages}
        end
    end

    def update
        favorite_card = FavoriteCard.find(params[:id])
        favorite_card.update(update_params)
        render json: favorite_card
    end

    def destroy
        favorite_card = FavoriteCard.find(params[:id])
        favorite_card.destroy
    end

    private

    def favorite_card_params
        params.permit(:user_id, :binder_id, :amount, :foil, :icon, :name, :img_url, :category_id, :product_id, :group_id, :rarity, :sub_type, :text, :group_name, :normal_low_price , :normal_mid_price, :normal_high_price, :normal_market_price, :foil_low_price, :foil_mid_price, :foil_high_price,:foil_market_price)
    end

    def update_params
        params.permit(:amount, :icon)
    end
end

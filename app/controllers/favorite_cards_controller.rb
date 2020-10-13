class FavoriteCardsController < ApplicationController
    def index
        favorite_cards = FavoriteCard.all
        render json: favorite_cards
    end

    def show
        favorite_card = FavoriteCard.find(params[:id])
        render json: favorite_card
    end
end

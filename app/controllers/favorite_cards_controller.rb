class FavoriteCardsController < ApplicationController
    def index
        favorite_cards = FavoriteCard.all
        render json: favorite_cards
    end
end

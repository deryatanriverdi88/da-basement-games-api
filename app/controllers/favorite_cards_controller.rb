class FavoriteCardsController < ApplicationController
    def index
        favorite_cards = FavoriteCard.all.alphabetical
        render json: favorite_cards
    end

    def cards
    favorite_cards = []
        if params[:rarity]
            favorite_cards =  FavoriteCard.where(
                FavoriteCard.arel_table[:rarity]
                   .lower
                   .matches(params[:rarity].downcase)
            )
        elsif params[:setName]
            favorite_cards = FavoriteCard.where(
                FavoriteCard.arel_table[:group_name]
                   .lower
                   .matches(params[:setName].downcase)
            )
        elsif params[:colorName]
            favorite_cards = FavoriteCard.where(
                FavoriteCard.arel_table[:color]
                   .lower
                   .matches(params[:colorName].downcase)
            )
        elsif params[:binder] === "no-binder"
            favorite_cards = FavoriteCard.all.filter{|card| !card.binder_id}
        end
        render json: favorite_cards
    end

    def first_ten
        render json:cards = FavoriteCard.all.alphabetical.first(10)
    end

    def sets
        render json: FavoriteCard.all.alphabetical.uniq(&:group_name)
    end

    def cards_with_binder
        favorite_cards = []
        if params[:rarity]
            favorite_cards = FavoriteCard.all.filter{|card| card[:rarity] == params[:rarity] && card[:binder_id] == params[:binder].to_i}
        elsif params[:setName]
            favorite_cards = FavoriteCard.all.filter{|card| card[:group_name] == params[:setName] && card[:binder_id] == params[:binder].to_i}
        elsif params[:colorName]
            favorite_cards = FavoriteCard.all.filter{|card| card[:color] == params[:colorName] && card[:binder_id] == params[:binder].to_i}
        end
        render json: favorite_cards
    end

    def card_with_setname
        favorite_card = []
        render json: favorite_card = FavoriteCard.all.filter{|card| card[:name] == params[:name] && card[:group_name] == params[:setName]}
    end

    def cards_with_setname
        favorite_cards = []
        render json: favorite_cards = FavoriteCard.all.filter{|card| card[:group_name] == params[:setName]}
    end

    def show
        favorite_card = FavoriteCard.find(params[:id])
        render json: favorite_card
    end

    def create
    favorite_card = FavoriteCard.find_by(product_id: params[:product_id], binder_id: params[:binder_id], foil: params[:foil])
        if favorite_card
            amount = favorite_card[:amount]
            favorite_card.update(amount: amount += params[:amount])
        else
            favorite_card = FavoriteCard.create(favorite_card_params)
        end
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
        params.permit(:user_id, :binder_id, :amount, :foil, :icon, :name, :img_url, :category_id, :product_id, :group_id, :rarity, :sub_type, :text, :group_name, :normal_low_price , :normal_mid_price, :normal_high_price, :normal_market_price, :foil_low_price, :foil_mid_price, :foil_high_price,:foil_market_price, :color)
    end

    def update_params
        params.permit(:amount, :binder, :foil, :color)
    end
end

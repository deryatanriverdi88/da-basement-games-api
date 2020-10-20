# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

ENV["api_private_key"]
ENV["api_public_key"]
payload = "grant_type=client_credentials&client_id="+ENV["api_public_key"]+"&client_secret="+ENV["api_private_key"]

token = RestClient.post("https://api.tcgplayer.com/token", payload  ,headers={"content-type": "application/x-www-form-urlencoded"})

token = JSON.parse(token)
@access_token = token['access_token']

    FavoriteCard.default_order.all.each do |c|
        puts 'card name => ' + c['name'] + ' product_id => ' + c['product_id'].to_s + ' id => ' + c['id'].to_s
        price_response = RestClient.get'https://api.tcgplayer.com/pricing/product/' + c['product_id'].to_s, {:Authorization => 'Bearer '+ @access_token}

        price_json = JSON.parse(price_response)['results']
        puts 'price_json => ', price_json
        puts 'card in database => ', c['product_id']
        puts 'card id database => ', c['id']
        price_json.map do |price_data|
        puts 'subTypeName => ', price_data['subTypeName']
            if price_data['subTypeName'] == 'Normal'
                puts 'it should be normal price = >', price_data['lowPrice']
                c.update(
                    normal_low_price: price_data['lowPrice'],
                    normal_mid_price: price_data['midPrice'],
                    normal_high_price: price_data['highPrice'],
                    normal_market_price: price_data['marketPrice']
                )
            elsif price_data['subTypeName'] == 'Foil'
                puts 'it should be foil price = >', price_data['lowPrice']
                c.update(
                    foil_low_price: price_data['lowPrice'],
                    foil_mid_price:price_data['midPrice'],
                    foil_high_price: price_data['highPrice'],
                    foil_market_price:price_data['marketPrice']
                )
            end
        end
        puts 'card updated' + ' card normal_low_price => ' + c['normal_low_price'].to_s
        puts 'card updated' + ' card foil_low_price => ' + c['foil_low_price'].to_s
        puts 'foil => ', c['foil']
    end

end

puts "Seeded 🍇"
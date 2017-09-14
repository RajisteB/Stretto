require 'Httparty'

class FestivalsController <ApplicationController
    include HTTParty

    def home
    
    end

    def index
        @seatgeek = Rails.application.secrets.seat_geek_api_key
        response = HTTParty.get("https://api.seatgeek.com/2/events?type=music_festival&client_id=#{@seatgeek}") 
        @res = JSON.parse response.to_s, symbolize_names: true
    end

    def show
        params[:id]
        @seatgeek = Rails.application.secrets.seat_geek_api_key
        response = HTTParty.get("https://api.seatgeek.com/2/events/#{params[:id]}?client_id=#{@seatgeek}") 
        @res = JSON.parse response.to_s, symbolize_names: true
        @performer_id = @res[:performers][0][:id]
        recommendation = HTTParty.get("https://api.seatgeek.com/2/recommendations/performers?performers.id=#{@performer_id}&client_id=#{@seatgeek}")
        @rec = JSON.parse recommendation.to_s, symbolize_names: true
    end


end
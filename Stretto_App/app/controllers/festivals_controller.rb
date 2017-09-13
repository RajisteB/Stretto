require 'Httparty'

class FestivalsController <ApplicationController
    include HTTParty

    def home
    
    end

    def index
        @seatgeek = Rails.application.secrets.seat_geek_api_key
        @response = HTTParty.get("https://api.seatgeek.com/2/events?q=music_festival&client_id=#{@seatgeek}") 
    end

end
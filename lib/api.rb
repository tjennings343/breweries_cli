#handle all API requests

class Api
    
    def self.fetch_cities(city)
        url = "https://api.openbrewerydb.org/breweries?by_city=#{city}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        cities = JSON.parse(response)
        binding.pry

    end
end
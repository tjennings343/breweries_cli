

class Api
    
    def self.fetch_breweries(city)
        url = "https://api.openbrewerydb.org/breweries?by_city=#{city}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        cities = JSON.parse(response)
        cities.each do |c|    
           Breweries.new(name: c["name"], street: c["street"], state: c["state"], website: c["website_url"], city: city)
           
        end
    end
end
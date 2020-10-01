

class Cli

    def start
        puts ""
        puts "Welcome to Brewery Tour"
        puts ""
        puts "Please enter your city to begin"
        puts ""
        @city = gets.chomp.downcase
        Api.fetch_cities(@city)
        puts ""
        breweries = Breweries.all
        print_breweries(breweries)
        puts ""
        puts "Select number to see details, or type 'exit' to start over"
        puts ""
        user_inp = gets.chomp.downcase 
        brewery = breweries[user_inp.to_i - 1]
        # print_brewery_info(brewery)
        # binding.pry

    end

    def print_breweries(br)
        puts "Local breweries in #{@city.capitalize}"
        puts ""
        br.each_with_index do |b,i|
            puts " #{i + 1}: #{b.name}"
        end
    end

    # def print_brewery_info(brew)

    # end

end
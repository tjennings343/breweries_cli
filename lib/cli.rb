

class Cli

    def start
        puts intro
        @city = gets.chomp.downcase
        Api.fetch_cities(@city)
        breweries = Breweries.all
        print_breweries(breweries)
        puts list_prompt
        user_inp = gets.chomp.downcase
        while user_inp != 'exit' do
            brewery = Breweries.find_city(@city)[user_inp.to_i - 1]
            print_brewery_info(brewery)
            puts ""
            puts "Type 'list' to go back to the list or type 'exit' exit"
            puts ""
            if user_inp == 'list'
                print_breweries(breweries)
                puts ""
                puts list_prompt
            elsif user_inp == 'search'
                puts "type a new city to search"
                user_inp = gets.chomp.downcase
                Api.fetch_cities(user_inp)
                print_breweries(breweries)
            end
            user_inp = gets.chomp.downcase
        end
        puts ""
        puts "Goodbye"
    end


       
    def print_breweries(br)
        puts "Local breweries in #{@city.capitalize}"
        puts ""       
        br.each_with_index do |b,i|
            puts " #{i + 1}: #{b.name}"
        end
    end

     def print_brewery_info(brew)
        puts brew.name
        puts ""
        puts brew.city.capitalize
        puts brew.state
        puts brew.street
        puts brew.website
     end

     def intro
        puts ""
        puts "Welcome to Brewery Search"
        puts "Enter city to begin" 
     end

     def list_prompt
        puts ""
        puts "Select number to see details, or type 'exit' to quit"
     end

end
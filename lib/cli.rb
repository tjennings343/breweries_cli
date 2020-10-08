

class Cli

    def start
        puts intro
        @city = gets.chomp.downcase
        Api.fetch_breweries(@city)
        breweries = Breweries.all
            if breweries.length > 0
            print_breweries(breweries)
            puts list_prompt
            else 
            puts ""
            puts "Not recognized, please try again."
            puts ""
            @city = gets.chomp.downcase
            Api.fetch_breweries(@city)
            print_breweries(breweries)
            puts list_prompt
            end
        user_inp = gets.chomp.downcase
        while user_inp != 'exit' do
            if user_inp.to_i > 0 && user_inp.to_i <= Breweries.find_brewery_city(@city).length
                brewery = Breweries.find_brewery_city(@city)[user_inp.to_i - 1]
                print_brewery_info(brewery)
                puts ""
                puts "Type 'list' to go back to the list or type 'search' to search a new city or type 'exit' exit"
                puts ""
                inp_2 = gets.chomp.downcase
                if inp_2 == 'list'
                    print_breweries(breweries)
                    puts ""
                    puts list_prompt
                elsif inp_2 == 'search'
                    puts ""
                    puts "type a new city to search"
                    @city = gets.chomp.downcase                   
                    if Breweries.find_brewery_city(@city).length == 0
                        Api.fetch_breweries(@city)
                    end
                    breweries = Breweries.find_brewery_city(@city)
                    print_breweries(breweries)
                    puts list_prompt
                end
            else
                puts "Please select a number on the list"
            end
            user_inp = gets.chomp.downcase
        end
        puts ""
        puts "Goodbye"
    end



#prompt methods
       
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
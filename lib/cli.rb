#user interaction
#contain all gets and puts
#control flow of program

class Cli

    def start
        puts ""
        puts "Welcome to Brewery Tour"
        puts ""
        puts "Please enter your city to begin"
        puts ""
        @city = gets.chomp.downcase
        Api.fetch_cities(@city).to_i

    end
end
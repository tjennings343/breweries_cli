
class Breweries
    attr_accessor :name, :street, :state, :website, :city

    @@all = []

    def initialize(name:, street:, state:, website:, city:)
        @name = name
        @street = street
        @state = state
        @website = website
        @city = city 
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_city(city)
        @@all.select {|d| d.city == city }
    end 
end


class Genre
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :songs, :artist

    @@all = []
    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        song = self.new(name)
        song.save
        song
    end

    def artists
        songs.collect{|song| song.artist}.uniq
    end

    
end
class Artist

    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def add_song(song)
        self.songs << song unless self.songs.include?(song)
        song.artist = self unless song.artist == self
        song
    end

    def self.find_or_create_by_name(name)
        self.find(name) || self.create(name)
    end

    def self.find(name)
        @@all.detect {|artist| artist.name == name}
    end

    def self.create(name)
        artist = Artist.new(name) 
        @@all << artist
        artist
    end

    def save
        @@all << self
        self
    end

    def print_songs
       self.songs.each { |song| puts song.name }
    end

    # def songs
    #   Song.all.select {|song| artist.song == self}
    # end

    def self.all
        @@all.uniq
    end

end
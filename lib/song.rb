class Song

    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        @artist = []
    end

    def self.all
        @@all
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self) unless artist.songs.include?(self)
    end

    def artist_name=(artist)
        @artist = artist
        artist = Artist.find_or_create_by_name(artist) 
        self.artist = artist
    end

    def self.new_by_filename(file)
        #test through pry
        data = file.split(" - ")
        artist_name = data[0]
        song_name = data[1]
        a = Artist.find_or_create_by_name(artist_name)
        a.add_song(Song.new(song_name))
    end

    def save
        @@all << self
        self
    end

end
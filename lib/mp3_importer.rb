class MP3Importer

    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.entries(path).reject { |i| i == '.' || i == '..' }
        #Dir.entries(path)[2..-1]
    end

    def import
        files.each { |i| Song.new_by_filename(i) }
    end

end
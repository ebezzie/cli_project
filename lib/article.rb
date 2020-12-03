# my standard oo class
class Article
    attr_accessor :author, :title, :description, :url

    @@all = []

    def initialize(author, title, description, url)
        @author = author
        @title = title
        @description = description
        @url = url 

        @@all << self 
    end
    def self.all
        @@all
    end
end

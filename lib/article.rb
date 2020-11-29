# my standard oo class
class Article
    attr_accessor :author, :title, :description, :url

    @@all = []

    def initialize(author, title, description, url) #these 4 attributes can be passed in anytime we call .new 
        @author = author
        @title = title
        @description = description
        @url = url 

        @@all << self #the ability to save every article 
    end
    def self.all
        @@all #ablity to access the class variable has no value outside of this class
    end
end

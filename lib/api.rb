#set up like a class responsible for talking with our API
class Api

    def self.start
        url = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=803657a60ba24633b6b27917e25c81f9"
        uri = URI(url) 
        response = Net::HTTP.get(uri) 
        hash = JSON.parse(response) 
        array_of_articles = hash["articles"]
         array_of_articles.each do |article|  
            Article.new(article["author"], article["title"], article["description"], article["url"])
        end
    end
end
#set up like a class
#responsible for talking with our API

class Api

    def self.start
        url = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=803657a60ba24633b6b27917e25c81f9"
        uri = URI(url) #changing the url into an object
        response = Net::HTTP.get(uri) #getting back a weird response
        hash = JSON.parse(response) #want to make that response readable
        array_of_articles = hash["articles"]
         array_of_articles.each do |article| #turn each article into its own object 
            Article.new(article["author"], article["title"], article["description"], article["url"]) #making an object that contains the api data I need
        end
    end
end
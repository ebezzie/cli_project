#set up like a class
#responsible for talking with our API

class API

    def self.start
        url = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=803657a60ba24633b6b27917e25c81f9"
        uri = URI(url) #changing the url into an object
        response = Net::HTTP.get(uri) #getting back a weird response
        formatted_response = JSON.parse(response) #want to make that response readable
        binding.pry
    end
end
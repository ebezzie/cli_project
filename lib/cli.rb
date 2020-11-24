# Command Line Interface 
# interact with the user and connect our files together

class Cli
    def start
        puts "Welcome to Today's Top News"
        Api.start
        self.menu
    end
    def menu 
        puts "Would you like to see a list of the newest articles?" #can change the question but this is the first prompt
        puts "Type 'yes'to continue or any other key to exit." #change 13/14/16/17
        user_input = gets.strip # to get user input 
        if user_input == "yes" || user_input == "y" #if it equals yes or y
            puts "\n Here they are!\n"
            displays_all_of_the_articles
            puts "\n Which article number are you interested in?\n"
            ask_user_which_article_to_read 
            sleep (1)
            menu
        else 
            #end the program
            puts "Goodbye!"
        end
    end 
    def displays_all_of_the_articles
        # access all of the articles and print each 
        Article.all.each.with_index(1) do |article, index| #.each because we do not care about return value and use with_index to add numbers by each title 
            puts "#{index}. #{article.title}" #use .title to print the title instead of the object ID interpolate so index comes out cleaner
        end
    end
    def ask_user_which_article_to_read #asked user what they want to read 
        index = gets.strip.to_i - 1 #accepts input and turns it into an integer so we dont get a stringand subtract 1 from it so it correlates with our array 
        until index.between?(0,Article.all.length - 1) # checking input - taking the length of Article - 1 to ensure the number they enter is a valid index number
            puts "Sorry that is an invalid choice, please select another article number"
            index = gets.strip.to_i - 1
        end
        article_instance = Article.all[index] #found their article choice and saved it as a variable
        #call a method that will print out details 
        puts article_instance.title
        puts "Would you like to read more about this article?"
        puts "Type 'yes'to continue, 'new' to select a new article, or any other key to exit."
            user_input = gets.strip # to get user input 
            if user_input == "yes" || user_input == "y" #if it equals yes or y
                puts "Here is the information you requested!" 
                display_article_details(article_instance)
                #insert the rest of the information about the article here
            elsif  user_input == "new" || user_input == "n"  #send person back to menu
                puts "Ok, please select another article"
                ask_user_which_article_to_read 
            #insert the rest of the information about the article here
            else 
                #end the program
                puts "Goodbye!"
            end
    end
    def  display_article_details(article)
        puts article.title
        puts article.author
        puts article.description
        puts article.url
    end
        
end

# Command Line Interface interact with the user and connect files together
class Cli
    def start
        puts "Welcome to Today's Top News"
        Api.start
        self.menu
    end
    #starts the menu gets user input follows the if statement to determine what the user will see next
    #if the input is anything other than yes or y it will exit the program if it is yes or y it will run through 
    #the methods and then return to the main menu after 1 second 
    def menu 
        puts "Would you like to see a list of the newest articles?" 
        puts "Type 'yes'to continue or any other key to exit." 
        user_input = gets.strip 
        if user_input == "yes" || user_input == "y" 
            puts "\n Here they are!\n"
            displays_all_of_the_articles
            puts "\n Which article number are you interested in?\n"
            ask_user_which_article_to_read 
            sleep (1)
            menu
        else 
            puts "Goodbye!"
        end
    end 
    # access all of the articles and print each 
    #.each because we do not care about return value and use with_index to add numbers by each title 
    #use .title to print the title instead of the object ID interpolate so index comes out cleaner
    def displays_all_of_the_articles
        Article.all.each.with_index(1) do |article, index|
            puts "#{index}. #{article.title}" 
        end
    end
    #asked user what they want to read
    #41 accepts input and turns it into an integer so we dont get a stringand subs 1 from it so it correlates with our array 
    #42 checks input - taking the length of Article - 1 to ensure the number they enter is a valid index number
    #46 found their article choice and saved it as a variable
    #47 call a method that will print out details 
    #54 send person back to menu
    def ask_user_which_article_to_read 
        index = gets.strip.to_i - 1
        until index.between?(0,Article.all.length - 1)
            puts "Sorry that is an invalid choice, please select another article number"
            index = gets.strip.to_i - 1
        end
        article_instance = Article.all[index]
        puts article_instance.title
        puts "Would you like to read more about this article?"
        puts "Type 'yes'to continue, 'new' to select a new article, or any other key to exit."
            user_input = gets.strip 
            if user_input == "yes" || user_input == "y" 
                puts "Here is the information you requested!" 
                display_article_details(article_instance)
            elsif  user_input == "new" || user_input == "n"  
                puts "Ok, please select another article"
                ask_user_which_article_to_read 
            else 
                puts "Goodbye!"
            end
    end
    def  display_article_details(article)
        puts "Title: #{article.title}"
        puts "Author: #{article.author}"
        puts "Description: #{article.description}"
        puts "Url: #{article.url}"
    end
end

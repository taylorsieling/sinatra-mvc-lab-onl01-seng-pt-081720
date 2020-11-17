require 'pry'

class PigLatinizer

    attr_accessor :user_input

    def piglatinize(string)
        #take in a string, divide into individual words
        #piglatinize each word, join them back together

        split_string = string.split(" ")
        latin_array = split_string.map {|word| piglatinize_word(word)}
        latin_array.join(" ")

    end

    def piglatinize_word(word)

        #check if word starts with a vowel
        #if it starts with a consonate
        #determine where first vowel is

        first_letter = word[0].downcase
        if ["a", "e", "i", "o", "u"].include?(first_letter)
            "#{word}way"
        else
            #create an array to move consonates into while check for first vowel
            #automatically shovel in first letter
            consonates = []
            consonates << word[0]

            #check second letter for vowel
            if ["a", "e", "i", "o", "u"].include?(word[1]) == false
                consonates << word[1]
                #check third letter for vowel
                if ["a", "e", "i", "o", "u"].include?(word[2]) == false
                    consonates << word[2]
                end
            end

            #take word starting with first vowel, add the shoveled consonates, add ay
            "#{word[consonates.length..-1] + consonates.join + "ay"}"

        end

    end

end
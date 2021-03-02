class ApiServices::CommonWordFinder < ApplicationService

  def call
    names_array = Record.pluck(:title)
    word_array = names_array.map{|a| a.downcase.scan(/[\w']+/)}.flatten

    words_frequency = Hash.new(0)
    most_common_words = []
    highest_frequency = 0

    for i in 0..word_array.length-1
      words_frequency[word_array[i]] += 1
      current_word_frequency = words_frequency[word_array[i]]
      if current_word_frequency > highest_frequency
        most_common_words = [word_array[i]]
        highest_frequency = current_word_frequency
      elsif current_word_frequency == highest_frequency
        most_common_words << word_array[i]
      end
    end
    { most_common_word: most_common_words, frequency: highest_frequency }
  end
end

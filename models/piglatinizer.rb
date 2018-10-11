class PigLatinizer
  #attr_accessor :text
  Vowels = ["a", "A", "e", "E", "i", "I", "o", "O", "u", "U"]


  # def initialize#(text)
  #   #@text = text
  #   self
  # end


  def piglatinize(text)
    if !text.include?(" ")
      piglatinize_word(text)
    else
      piglatinize_sentence(text)
    end
  end

  def piglatinize_word(word)
    if Vowels.include?(word[0])
      word << "way"
    else
      word_array = word.split("")
      first_vowel = word_array.find { |letter| Vowels.include?(letter) }
      #first_vowel = word_array.find { |letter| Vowels.include?(letter) }
      #new_middle_syllable = word_array.slice!(0, first_vowel.index-1)
      new_first_syllable = word_array.slice!(word_array.index(first_vowel), word_array.length-word_array.index(first_vowel))
      #word_array << new_middle_syllable
      new_first_syllable << word_array
      new_first_syllable << "a"
      new_first_syllable << "y"
      word = new_first_syllable.join("")
    end
  end

  def piglatinize_sentence(sentence)
    sentence_array = sentence.split(" ").map do |word|
      piglatinize_word(word)
    end
    sentence_array.join(" ")
  end





  # def piglatinize_sentence(sentence)
  #   sentence.split(" ").map do |word|
  #     if Vowels.include?(word[0])
  #       word << "way"
  #     else
  #       first_vowel = word.split("").find { |letter| Vowels.include?(letter) }
  #       new_middle_syllable = word.slice!(0, first_vowel.index-1)
  #       word << new_middle_syllable
  #       word << "ay"
  #     end
  #   end
  #   piglatinized_array.join(" ")
  # end
end


# class PigLatinizer
#
#   def piglatinize(input_str)
#     x = (input_str.split(" ").length == 1) ? piglatinize_word(input_str) : piglatinize_sentence(input_str)
#     puts x
#     x
#   end
#
#   private
#
#   def consonant?(char)
#     !char.match(/[aAeEiIoOuU]/)
#   end
#
#   def piglatinize_word(word)
#     # word starts with vowel
#     if !consonant?(word[0])
#       word = word + "w"
#     # word starts with 3 consonants
#     elsif consonant?(word[0]) && consonant?(word[1]) && consonant?(word[2])
#       word = word.slice(3..-1) + word.slice(0,3)
#     # word starts with 2 consonants
#     elsif consonant?(word[0]) && consonant?(word[1])
#       word = word.slice(2..-1) + word.slice(0,2)
#     # word starts with 1 consonant
#     else
#       word = word.slice(1..-1) + word.slice(0)
#     end
#     word << "ay"
#   end
#
#   def piglatinize_sentence(sentence)
#     sentence.split.collect { |word| piglatinize_word(word) }.join(" ")
#   end
#
# end

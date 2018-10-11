# class PigLatinizer
#   #attr_accessor :text
#   Vowels = ["a", "e", "i", "o", "u"]
#
#
#   # def initialize#(text)
#   #   #@text = text
#   #   self
#   # end
#
#
#
#   def piglatinize(sentence)
#     piglatinized_array = sentence.split(" ").map do |word|
#       if Vowels.include?(word[0])
#         word << "way"
#       else
#         first_vowel = word.split("").find do |letter|
#           Vowels.include?(letter)
#         end
#         new_middle_syllable = word.slice!(0, first_vowel.index-1.first)
#         word << new_middle_syllable
#         word << "ay"
#       end
#     end
#     piglatinized_array.join(" ")
#   end
# end


class PigLatinizer

  def piglatinize(input_str)
    x = (input_str.split(" ").length == 1) ? piglatinize_word(input_str) : piglatinize_sentence(input_str)
    puts x
    x
  end

  private

  def consonant?(char)
    !char.match(/[aAeEiIoOuU]/)
  end

  def piglatinize_word(word)
    # word starts with vowel
    if !consonant?(word[0])
      word = word + "w"
    # word starts with 3 consonants
    elsif consonant?(word[0]) && consonant?(word[1]) && consonant?(word[2])
      word = word.slice(3..-1) + word.slice(0,3)
    # word starts with 2 consonants
    elsif consonant?(word[0]) && consonant?(word[1])
      word = word.slice(2..-1) + word.slice(0,2)
    # word starts with 1 consonant
    else
      word = word.slice(1..-1) + word.slice(0)
    end
    word << "ay"
  end

  def piglatinize_sentence(sentence)
    sentence.split.collect { |word| piglatinize_word(word) }.join(" ")
  end

end

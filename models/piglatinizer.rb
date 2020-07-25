class PigLatinizer
  #attr_accessor :text
  Vowels = ["a", "A", "e", "E", "i", "I", "o", "O", "u", "U"]
 #Notice, Omar, that there is no initialize or create emthod in this
 #entire class.  The app.rb controller simply calls
 # "PigLatinizer.new.piglatinize()".

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
      new_first_syllable_array = word_array.slice!(word_array.index(first_vowel), word_array.length-word_array.index(first_vowel))
      new_first_syllable_array << word_array
      word = new_first_syllable_array.join + "ay"
    end
  end

  def piglatinize_sentence(sentence)
    sentence_array = sentence.split(" ").map do |word|
      piglatinize_word(word)
    end
    sentence_array.join(" ")
  end
end

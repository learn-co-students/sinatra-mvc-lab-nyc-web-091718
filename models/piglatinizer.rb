class PigLatinizer
  attr_reader :text

  def initialize(text)
    @text = text.downcase
  end

  def pig_word(word)
    # returns the character index of the first vowel
    w_index = word.index(/[aeiou]/)

    # words that begin with vowel sounds, one just adds "way" or "yay" to the end (or just "ay").
    if word.start_with?('a','e','i','o','u')
      result = word + 'way'
    else
      # if word begins with consonant sounds all letters before the 1st vowel are placed at the end of the word sequence. Then, "ay" is added.
      result = word[w_index..-1]+word[0...w_index]+'ay'
    end
    result
  end #end pig_word method

  def pig_sentence
    array = text.split(' ')
    array.map {|word| pig_word(word)}.join(' ')
  end #end pig_sentence method

end #end PigLatinizer class

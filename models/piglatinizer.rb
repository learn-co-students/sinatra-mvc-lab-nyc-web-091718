require 'pry'

class PigLatinizer
  attr_reader :phrase

  def initialize
    @phrase = phrase
  end



  def vowel?(char)
    char.match(/[aAeEiIoOuU]/)
  end

  def piglatinize(phrase)
    if phrase.split(" ").length == 1
      if vowel?(phrase[0])
        phrase = phrase + "w"
      elsif !vowel?(phrase[0]) && !vowel?(phrase[1]) && !vowel?(phrase[2])
        phrase = phrase.slice(3..-1) + phrase.slice(0,3)
      elsif !vowel?(phrase[0]) && !vowel?(phrase[1])
        phrase = phrase.slice(2..-1) + phrase.slice(0,2)
      else
        phrase = phrase.slice(1..-1) + phrase.slice(0)
      end
      phrase << "ay"
    else
      words = phrase.split(" ")
      phrase = words.map do |word|
        if vowel?(word[0])
          word = word + "w"
          word + "ay"
        elsif !vowel?(word[0]) && !vowel?(word[1]) && !vowel?(word[2])
          word = word.slice(3..-1) + word.slice(0,3)
          word + "ay"
        elsif !vowel?(word[0]) && !vowel?(word[1])
          word = word.slice(2..-1) + word.slice(0,2)
          word + "ay"
        else
          word = word.slice(1..-1) + word.slice(0)
          word + "ay"
        end
      end.join(" ")
    end
    phrase
  end

end ### End of Class

### If first letter is a vowel add way
####Else take the second letter through the last and add the first letter plus 'ay'

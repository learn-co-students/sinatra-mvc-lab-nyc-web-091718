class PigLatinizer
  attr_reader :input


  def initialize(text)
    @text = text
  end

  def translate
    pig_latin = []
    @text.split(" ").each do |word|
      word.gsub(/[^a-z]/,'') #remove punctuation
      if word[0].scan(/[aeiou]/)[0] #if first letter is vowel
        pig_latin << "#{word}way"
      else
        word = "#{word[1..-1]}#{word[0]}ay"
        pig_latin << word
      end
    end
    pig_latin.join(" ")
  end

end

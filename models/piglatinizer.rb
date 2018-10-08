class PigLatinizer

  def initialize
  end

  def piglatinize(string)
    vowels = ['a','e','i','o','u','A','E','I','O','U']
    string.split(' ').map do |word|
      if vowels.include?(word[0])
        vowelstart(word)
      elsif !vowels.include?(word[0]) && !vowels.include?(word[1]) && !vowels.include?(word[2])
        threeconsonants(word)
      elsif !vowels.include?(word[0]) && !vowels.include?(word[1])
        consonantcluster(word)
      else
        consonantstart(word)
      end
    end.join(" ")
  end

  def consonantcluster(string)
    first_letters = string[0..1]
    "#{string[2..-1]}" + first_letters + "ay"
  end

  def consonantstart(string)
    first_letter = string[0]
    "#{string[1..-1]}" + first_letter + "ay"
  end

  def vowelstart(string)
    string+"way"
  end

  def threeconsonants(string)
    first_letters = string[0..2]
    "#{string[3..-1]}" + first_letters + "ay"
  end
end

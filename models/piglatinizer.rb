
class PigLatinizer

  Checker = /\A[^aeiou]+{1}/i

  def piglatinize (phrase)
    phrase_swapped = phrase.split(" ").map do |word|
      latinize(word)
    end
    phrase_swapped.join(" ")
  end

  def latinize(word)
    answer = ""
    if(Checker.match(word) == nil)
      answer = "#{word}way"
    else
      length = Checker.match(word).to_s.length
      attach_to_end =  word.slice(0,length)
      answer = "#{word.slice(length,word.length - length) + attach_to_end}ay"
      answer
    end
  end

end

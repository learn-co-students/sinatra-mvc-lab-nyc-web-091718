class PigLatinizer

  def initialize

  end

  def piglatinize(text)
    words = text.split(" ")
    vowels = ['a','e','i','o','u']
    pl_words = words.map do |word|
      if vowels.include? word[0].downcase
        word + "way"
      else
        #word[1..word.size] + word[0] + "ay"
        new_word_arr = []
        split_word = word.split('')
        split_word.each_with_index do |let, i|
          if vowels.include? let
            #binding.pry
            new_word_arr = split_word[i..split_word.size] + split_word[0..(i-1)]
            break
          end
        end
        new_word = new_word_arr.join + "ay"
        #binding.pry
        new_word
      end
    end

    if pl_words.size == 1
      pl_words.first
    else
      pl_words.join(" ")
    end
  end
end

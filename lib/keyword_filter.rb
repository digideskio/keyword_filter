# encoding: utf-8

require "keyword_filter/version"

module KeywordFilter
  extend self

  #
  # 广告词, 敏感词过滤, 采用 DFA 算法
  #
  attr_reader :dict

  SPECIFIC_SYMBOL = %w(
    ~ ! @ # $ % ^ & * ( ) _ - + = [ ] { } | < > / ? ; : ' " , . \ |
    。 ， 《 》 ？ 、 「 」 【 】 （ ） ； ‘ ’ “ ” ： ·
  ).freeze

  def clear
    @dict = {}
  end

  def add(*words)
    @dict ||= { is_end: false }
    words.each do |word|
      current_dict = @dict
      word.each_char.with_index do |char, index|
        if word_map = current_dict[char]
          current_dict = word_map
        else
          new_dict = { is_end: false }
          current_dict[char] = new_dict
          current_dict = new_dict
        end

        if index == word.length - 1
          current_dict.merge!(is_end: true)
        end
      end
    end
  end

  def filtered_words
    @filtered_words ||= []
  end

  def filter(text)
    filtered_words.clear
    tmp_dict = self.dict

    text.each_char do |ch|
      next if ch.blank? || ch == ' ' || SPECIFIC_SYMBOL.include?(ch)
      if next_dict = tmp_dict[ch]
        filtered_words << ch
        return true if next_dict[:is_end]
        tmp_dict = next_dict
      else
        filtered_words.clear
        tmp_dict = self.dict
        if next_dict = tmp_dict[ch]
          filtered_words << ch
          return true if next_dict[:is_end]
          tmp_dict = next_dict
        end
      end
    end

    false
  end
end

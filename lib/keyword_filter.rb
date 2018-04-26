# encoding: utf-8

require "keyword_filter/version"

class String
  SPECIFIC_SYMBOL = %w(
    ~ ! @ # $ % ^ & * ( ) _ - + = [ ] { } | < > / ? ; : ' " , . \ |
    。 ， 《 》 ？ 、 「 」 【 】 （ ） ； ‘ ’ “ ” ： ·
  ).freeze

  def is_ignore_word?
    self.empty? || self == ' ' || SPECIFIC_SYMBOL.include?(self)
  end
end

module KeywordFilter
  extend self
  #
  # 广告词, 敏感词过滤, 采用 DFA 算法
  #
  attr_reader :dict

  alias_method :tree, :dict

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
    true
  end

  def filtered_words
    @filtered_words ||= []
  end

  def filter(text)
    filtered_words.clear

    (0..text.length - 1).each do |i|
      tmp_dict = self.dict
      text[i..-1].each_char do |ch|
        next if ch.is_ignore_word?
        if next_dict = tmp_dict[ch]
          filtered_words << ch
          return true if next_dict[:is_end]
          tmp_dict = next_dict
        else
          filtered_words.clear
          break
        end
      end
    end

    false
  end
end

class LineAnalyzer
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number

  def initialize(content, line_number)
    @content = content
    @line_number = line_number
    @highest_wf_count = 0
    @highest_wf_words = []
    calculate_word_frequency
  end

  def calculate_word_frequency()
    count_words = Hash.new
    @content.split(" ").each do |word|
      word.downcase!
      count_words[word] = count_words[word].nil? ? 1 : count_words[word] + 1
      if count_words[word] > @highest_wf_count
        @highest_wf_count = count_words[word]
        @highest_wf_words = []
        @highest_wf_words << word
      elsif count_words[word] == @highest_wf_count
        @highest_wf_words << word
      end 
    end
  end
end

class Solution
  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines

  def initialize
    @analyzers = Array.new
  end

  def analyze_file
    line_num = 0
    File.foreach( 'test.txt' ) do |line|
      line_num += 1
      @analyzers << LineAnalyzer.new(line, line_num)
    end
  end

  def calculate_line_with_highest_frequency
    @highest_count_words_across_lines = Array.new
    @highest_count_across_lines = 0
    @analyzers.each do |analyzer|
      @highest_count_across_lines = analyzer.highest_wf_count if analyzer.highest_wf_count > @highest_count_across_lines
      @highest_count_words_across_lines << analyzer if analyzer.highest_wf_count == @highest_count_across_lines
    end
  end

  def print_highest_word_frequency_across_lines
    puts @highest_count_words_across_lines.map(&:highest_wf_words).flatten.join(" ")
  end
end
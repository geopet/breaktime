require "break_time/version"
require "break_time/reddit"

module BreakTime

  def self.break(count, filename)
    @filename = filename

    reddit_break = BreakTime::RedditBreak.new(count, filename)
    reddit_break.parse
    reddit_break.write_break_markdown
    reddit_break.write_break_html
  end

  def self.file_open(extension)
    puts "Opening #{@filename}.#{extension} file..."
    `open /tmp/#{@filename}.#{extension}`
  end

end

require "break_time/version"
require "break_time/reddit"

module BreakTime

  def self.break(count, filename)
    @count = count
    @filename = filename

    reddit_break = BreakTime::RedditBreak.new(@count, @filename)
    reddit_break.parse
    reddit_break.write_break_markdown
    reddit_break.write_break_html

    puts "Opening #{@filename}.md file..."
    `open -a "/Applications/Marked 4.app" /tmp/#{@filename}.md`
  end

end

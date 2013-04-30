require "break_time/version"
require "break_time/reddit"

module BreakTime

  @filename = 'breaktime'

  def self.reddit
    reddit_break = BreakTime::RedditBreak.new(10, @filename)
    reddit_break.parse
    reddit_break.write_break_markdown
    reddit_break.write_break_html
  end

  def self.show_markdown
    puts "Opening doc/breaktime.md..."
    `open -a "/Applications/Marked 4.app" /tmp/breaktime.md`
  end

end

require "break_time/version"
require "break_time/reddit"

module BreakTime

  def self.reddit
    reddit_break = BreakTime::RedditBreak.new(5)
    reddit_break.write_break
  end

  def self.show_markdown
    puts "Opening doc/breaktime.md..."
    `open -a "/Applications/Marked 4.app" /tmp/breaktime.md`
  end

end

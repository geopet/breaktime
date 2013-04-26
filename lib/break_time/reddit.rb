require 'open-uri'
require 'json'
require 'date'

module BreakTime

  class RedditBreak
    def initialize(count)
      @count = count.to_i
      reddit_web = open('http://reddit.com/.json')
      @reddit_json = JSON.parse(reddit_web.read)
      puts "Reddit JSON captured..."
    end

    def write_break
      puts "Adding Reddit to break file..."

      datetime = Time.now.strftime("%F %r")
      break_time_file = File.new('/tmp/breaktime.md', 'w+')
      break_time_file.write("## Reddit at #{datetime}\n")

      @reddit_json['data']['children'][0..@count].each do |entry|
        break_time_file.write("1. [#{entry['data']['title']}](http://reddit.com#{entry['data']['permalink']}) _#{entry['data']['subreddit']}_  \n")
      end

      puts "Reddit break file ready..."
    end
  end

end

require 'open-uri'
require 'json'
require 'date'

module BreakTime

  class RedditBreak
    def initialize(count, filename)
      @count = count.to_i
      @filename = filename
      @reddit_web = open('http://reddit.com/.json')
      @datetime = Time.now.strftime("%F %r")
    end

    def parse
      @reddit_json = JSON.parse(@reddit_web.read)
      puts "Reddit JSON captured..."
    end

    def write_break_markdown
      puts "Adding Reddit to markdown break file..."

      break_time_file = File.open("/tmp/#{@filename}.md", "w")
      break_time_file.write("## Reddit at #{@datetime}\n")

      @reddit_json['data']['children'][0..@count].each do |entry|
        break_time_file.write("1. [#{entry['data']['title']}](http://reddit.com#{entry['data']['permalink']}) _#{entry['data']['subreddit']}_  \n")
      end

      puts "Reddit markdown break file ready..."
    end

    def write_break_html
      puts "Adding Reddit to html break file..."

      break_time_file = File.open("/tmp/#{@filename}.html", "w")
      break_time_file.write("<h2>Reddit at #{@datetime}</h2>")

      @reddit_json['data']['children'][0..@count].each do |entry|
        break_time_file.write("<p><a href='http://reddit.com#{entry['data']['permalink']}'>#{entry['data']['title']}</a> <em>#{entry['data']['subreddit']}</em></p>\n")
      end

      puts "Reddit html break file ready..."
    end

  end

end

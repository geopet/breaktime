require 'open-uri'
require 'json'
require 'date'

datetime =  Time.now.strftime("%F %r")

reddit_web = open('http://reddit.com/.json')
reddit_json = JSON.parse(reddit_web.read)

break_time_file = File.new('doc/breaktime.md', 'w+')
break_time_file.write("# Reddit at #{datetime}\n")

reddit_json['data']['children'].each do |entry|
  break_time_file.write("* [#{entry['data']['title']}](http://reddit.com#{entry['data']['permalink']})  \n")
end

puts "Break file ready..."
puts "Opening doc/breaktime.md"
`open -a "/Applications/Marked 4.app" doc/breaktime.md`

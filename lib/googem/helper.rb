require 'unirest'
require 'oj'
require 'tty-spinner'
require 'tty-pager'
require 'cgi'

module Googem
  module Helper
    def self.minutes_in_words(timestamp)
      minutes = (((Time.now - timestamp).abs)/60).round

      return nil if minutes < 0

      case minutes
      when 0..4            then 'less than 5 minutes ago'
      when 5..14           then 'less than 15 minutes ago'
      when 15..29          then 'less than 30 minutes ago'
      when 30..59          then 'greater than 30 minutes ago'
      when 60..119         then 'greater than 1 hour ago'
      when 120..239        then 'greater than 2 hours ago'
      when 240..479        then 'greater than 4 hours ago'
      when 480..719        then 'greater than 8 hours ago'
      when 720..1439       then 'greater than 12 hours ago'
      when 1440..11519     then 'greater than ' << ((minutes/1440).floor.to_s + ' day ago')
      when 11520..43199    then 'greater than ' << ((minutes/11520).floor.to_s + ' week ago')
      when 43200..525599   then 'greater than ' << ((minutes/43200).floor.to_s + ' month ago')
      else                      'greater than ' << ((minutes/525600).floor.to_s + ' year ago')
      end
    end
    def self.show_question question_id
      url = "https://api.stackexchange.com/2.2/questions/#{question_id}?pagesize=10&order=desc&sort=activity&site=stackoverflow&filter=!)5s.rMpmn9TU*hMdF1gjTFCFqR0v"
      spinner = TTY::Spinner.new("[:spinner] Getting data #{question_id} ... ", format: :pulse_2)

      prompt = -> (page_num) { output.puts "Page -#{page_num}- Press enter to continue" }
      pager = TTY::Pager::BasicPager.new
      spinner.auto_spin
      response = Unirest.get url, headers:{ "Accept" => "application/json" }
      document =  JSON.parse response.raw_body
      content = "Q: #{document["items"][0]["title"]}\nA: #{document["items"][0]["link"]}\n";
      content << "# QUESTION\n----------------------------------------------------------\n"
      content << "#{CGI.unescapeHTML(document["items"][0]["body_markdown"])}\n\n"
      content << "# ANSWERS\n----------------------------------------------------------\n"
      if document["items"][0]["answers"].nil?
        content << "No answers\n"
      else
        document["items"][0]["answers"].each_with_index do |i, index|
          content << "▷　#{index+ 1} ◇　by　#{i["owner"]["display_name"]}  ◇　#{minutes_in_words Time.at(i["creation_date"])}\n"
          content << "▷　#{i["link"]}\n"
          content << "----------------------------------------------------------\n"
          content << CGI.unescapeHTML(i["body_markdown"]) + "\n----------------------------------------------------------\n"
        end
      end
      spinner.success('Done!') # Stop animation
      pager.page content.encode('utf-8')
    end
  end
end
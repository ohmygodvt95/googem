require "googem/version"
require 'optparse'
require 'unirest'
require 'oj'
require 'tty-spinner'
require 'tty-pager'
require 'date'
require 'googem/helper'
require 'tty-prompt'

module Googem
  class Search
    BASE_URL = "https://api.stackexchange.com//2.2/search/advanced?order=desc&sort=activity&site=stackoverflow"

    def self.do keywords, options
      spinner = TTY::Spinner.new("[:spinner] Searching ...", format: :pulse_2)
      prompt = TTY::Prompt.new
      spinner.auto_spin
      response = Unirest.get "#{BASE_URL}&title=#{keywords}&page=#{options[:page]}&pagesize=#{options[:size]}", headers:{ "Accept" => "application/json" }
      document =  JSON.parse response.raw_body
      content = {}
      document["items"].each_with_index do |i, index|
        content["#{'%-3.3s' % (index + 1).to_s}#{i["title"]}\n#{'%-3.3s' % ''}#{i["link"]}\n#{'%-3.3s' % ''}by #{'%-25.25s' % i["owner"]["display_name"]} ◇ #{Helper.minutes_in_words Time.at(i["creation_date"])} ◇ Views #{i["view_count"]}　◇ Answers #{i["answer_count"]}\n"] = -> do Helper.show_question(i["question_id"]) end;
      end

      content["#{'%-3.3s' % "X"} Exit\n"] = -> do exit end;
      spinner.success('Done!') # Stop animation
      puts "--------------------------------------------------- \n"
      puts "Results found containing \"#{keywords}\": #{document["items"].count}"
      puts "--------------------------------------------------- \n"
      prompt.select("Choose your question?", content, cycle: true)
    end
  end
end

require 'optparse'
require 'googem'

module Googem
  class Cli
    def self.run args, out = STDOUT
      options = {page: 1, size: 5}
      ARGV << '-h' if ARGV.empty?
      parser = OptionParser.new do |opts|
        opts.banner = "Usage: googem [options]"

        opts.on("-v","--version", "Show googem version") do
          require "googem/version"
          out << "Googem v#{Googem::VERSION}\n"
          exit
        end

        opts.on("-k","--keyword KEYWORDS", String, "Search by keyword \"keywords\", eg: $ googem -k \"ruby\"") do |keywords|
          options[:keywords] = keywords ||= nil
        end

        opts.on("-p","--page [page]", Integer, "Page number") do |page|
          options[:page] = page
        end

        opts.on("-s","--size [size]", Integer, "Page size") do |size|
          options[:size] = size
        end

        opts.on_tail("-h", "--help", "Show list commands") do
          puts opts
          exit
        end
      end
      begin
        parser.parse! args
      rescue
        puts "An unknown error. Try again with new keywords."
      end
      Googem::Search.do options[:keywords], options
    end
  end
end
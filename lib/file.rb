require "css_parser"
require 'colorize'


class CssFiles
    include CssParser
    attr_reader :page
    def initialize
        @page = CssParser::Parser.new
    end
    
    def access_file(path)
        file_name = File.dirname(__FILE__) + path
        @page.load_file!(file_name)
        @page
    end
end
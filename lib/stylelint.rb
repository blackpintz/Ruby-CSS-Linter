require "css_parser"
include CssParser

class Stylelint
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

cssfile = Stylelint.new

puts cssfile.access_file('./tester_file/styles.css')

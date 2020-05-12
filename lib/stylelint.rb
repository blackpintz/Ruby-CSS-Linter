require "css_parser"
require 'colorize'
require_relative "modules.rb"

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

class Stylelint < CssFiles
    include Stylelint_methods
    attr_accessor :declarations
    def initialize
        super
        @declarations = ""
    end
    
    def declarations(selector)
        elements = @page.find_by_selector(selector) 
        @declarations = hash_decl(elements)
        @declarations
    end
    
end




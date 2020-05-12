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
    
    def px_measurement_not_allowed
        @declarations.each do |key, value|
        if(/px/.match("#{value}"))
          puts "#{value} is not allowed. Please use rems,ems or percentage units.".colorize(:red)
        else
          puts "Test passed".colorize(:green)
        end
        end
    end
    
    def declaration_limit_10
        if @declarations.length > 10
            puts "You cannot have more than 10 declarations in one selector".colorize(:red)
        else
            puts "Test passed for 10 declarations or less".colorize(:green)
        end
    end
    
    def id_limit_10
    no_of_ids = 0    
     @page.each_selector do |one|
     if one[0] == "#"
        no_of_ids += 1
     end
    end
    if no_of_ids > 4
        puts "You cannot use more that four ids in the css file.".colorize(:red)
    else
        puts "Test passed for four ids or less"
    end
    end
    
    def selector_names_lowercase
     @page.each_selector do |one|
     if(/[[:upper:]]/.match("#{one[0]}") || /[[:upper:]]/.match("#{one[1]}"))
         puts "Do not use a capitalized class identifier, #{one}".colorize(:red)
     else
         puts "Test passed for selector names".colorize(:green)
     end
     end
    end
    
    def selector_names_disallowed
    @page.each_selector do |one|
     if(one == ".body" || one == ".a" || one == ".html" || one == ".div")
         puts "You are not supposed to use #{one} as a class/id identifier.".colorize(:red)
     else
         puts "Test passed for selector names chosen".colorize(:green)
     end
    end
    end
end

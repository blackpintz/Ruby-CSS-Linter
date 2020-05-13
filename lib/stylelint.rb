require_relative "file.rb"
require_relative "modules.rb"

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
        msg = ""
        msg_arr = []
        @page.each_selector do |one|
        decs = declarations(one)
        decs.each do |key, value|
        if(/px/.match("#{value}"))
          msg = "#{value} is not allowed. Please use rems,ems or percentage units.".colorize(:red)
          msg_arr << msg
        end
        end
        end
        msg_arr.length > 0 ? msg_arr.each{|alert| alert} : "Test passed".colorize(:green)
    end
    
    def declaration_limit_10
        msg = ""
        msg_arr = []
        @page.each_selector do |one|
        decs = declarations(one)
        if decs.length > 10
         msg = "You cannot have more than 10 declarations in one selector".colorize(:red)
         msg_arr << msg
        end  
        end
        msg_arr.length > 0 ? msg_arr.each{|alert| alert} : "Test passed for 10 declarations or less".colorize(:green)
    end
    
    def id_limit_4
    no_of_ids = 0    
     @page.each_selector do |one|
     if one[0] == "#"
        no_of_ids += 1
     end
    end
    no_of_ids > 4 ? "You cannot use more that four ids in the css file.".colorize(:red) : "Test passed for four ids or less".colorize(:green)
    end
    
    def selector_names_lowercase
        msg = ""
        msg_arr = []
     @page.each_selector do |one|
     if(/[[:upper:]]/.match("#{one[0]}") || /[[:upper:]]/.match("#{one[1]}"))
         msg = "Do not use a capitalized class identifier, #{one}".colorize(:red)
         msg_arr << msg
     end
     end
     msg_arr.length > 0 ? msg_arr.each{|alert| alert} : "Test passed for selector names".colorize(:green)
    end
    
    def selector_names_disallowed
        msg = ""
        msg_arr = []
    @page.each_selector do |one|
     if(one == ".body" || one == ".a" || one == ".html" || one == ".div")
         msg = "You are not supposed to use #{one} as a class/id identifier.".colorize(:red)
         msg_arr << msg
     end
    end
    msg_arr.length > 0 ? msg_arr.each{|alert| alert} : "Test passed for selector names chosen".colorize(:green)
    end
    
    def validate
        px_measurement_not_allowed
        declaration_limit_10
        id_limit_10
        selector_names_lowercase
        selector_names_disallowed
    end
    
end



test_file = Stylelint.new
test_file.access_file('../../tester_file/spec_test.css')

 puts test_file.selector_names_disallowed




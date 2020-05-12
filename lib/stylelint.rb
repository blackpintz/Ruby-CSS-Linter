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
        @page.each_selector do |one|
        decs = declarations(one)
        decs.each do |key, value|
        if(/px/.match("#{value}"))
          puts "#{value} is not allowed. Please use rems,ems or percentage units.".colorize(:red)
        else
          puts "Test passed".colorize(:green)
        end
        end
        end
    end
    
    def declaration_limit_10
        @page.each_selector do |one|
        decs = declarations(one)
        if decs.length > 10
            puts "You cannot have more than 10 declarations in one selector".colorize(:red)
        else
            puts "Test passed for 10 declarations or less".colorize(:green)
        end  
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
    
    def validate
        px_measurement_not_allowed
        declaration_limit_10
        id_limit_10
        selector_names_lowercase
        selector_names_disallowed
    end
    
end





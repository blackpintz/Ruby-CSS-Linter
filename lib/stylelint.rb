require_relative 'file_path.rb'
require_relative 'stylelintmethods.rb'

class Stylelint < FilePath
  include StylelintMethods
  attr_reader :declarations
  def initialize
    super
    @declarations = ''
  end

  private

  def decl_method(selector)
    elements = @page.find_by_selector(selector)
    @declarations = hash_decl(elements)
    @declarations
  end

  def px_measurement_not_allowed
    msg = ''
    msg_arr = []
    @page.each_selector do |one|
      decs = decl_method(one)
      decs.each do |_key, value|
        if /px/.match(value.to_s)
          msg = "#{value} is not allowed in #{one}. Please use rems,ems or percentage units.".colorize(:red)
          msg_arr << msg
        end
      end
    end
    !msg_arr.empty? ? msg_arr.each { |alert| alert } : 'Test passed'.colorize(:green)
  end

  def declaration_limit_10
    msg = ''
    msg_arr = []
    @page.each_selector do |one|
      decs = decl_method(one)
      if decs.length > 10
        msg = "You cannot have more than 10 declarations in #{one}".colorize(:red)
        msg_arr << msg
      end
    end
    !msg_arr.empty? ? msg_arr.each { |alert| alert } : 'Test passed for 10 declarations or less'.colorize(:green)
  end

  def id_limit_4
    no_of_ids = 0
    @page.each_selector do |one|
      no_of_ids += 1 if one[0] == '#'
    end
    no_of_ids > 4 ? 'You cannot use more that four ids in the css file.'.colorize(:red) : 'Test passed for four ids or less'.colorize(:green)
  end

  def selector_names_lowercase
    msg = ''
    msg_arr = []
    @page.each_selector do |one|
      if /[[:upper:]]/.match((one[0]).to_s) || /[[:upper:]]/.match((one[1]).to_s)
        msg = "Do not use a capitalized class identifier, #{one}".colorize(:red)
        msg_arr << msg
      end
    end
    !msg_arr.empty? ? msg_arr.each { |alert| alert } : 'Test passed for selector names'.colorize(:green)
  end

  def selector_names_disallowed
    msg = ''
    msg_arr = []
    @page.each_selector do |one|
      if one == '.body' || one == '.a' || one == '.html' || one == '.div'
        msg = "You are not supposed to use #{one} as a class/id identifier.".colorize(:red)
        msg_arr << msg
      end
    end
    !msg_arr.empty? ? msg_arr.each { |alert| alert } : 'Test passed for selector names chosen'.colorize(:green)
  end

  public

  def validate
    puts px_measurement_not_allowed
    puts declaration_limit_10
    puts id_limit_4
    puts selector_names_lowercase
    puts selector_names_disallowed
  end
end

require_relative '../lib/stylelint.rb'

test_file = Stylelint.new
test_file.access_file('../../tester_file/styles.css')
test_file.validate

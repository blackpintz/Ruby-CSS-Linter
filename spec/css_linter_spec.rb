require_relative '../lib/stylelint.rb'
require_relative '../lib/file_path.rb'
require_relative '../lib/stylelintmethods.rb'

describe Stylelint do
  let(:myfile) { Stylelint.new }
  describe '#declarations' do
    it 'returns a hash of all declarations in a given selector' do
      myfile.access_file('../../tester_file/styles.css')
      expect(myfile.decl_method('div')).to eql({ color: 'blue', background: 'red', width: '10rem' })
    end
  end

  describe '#px_measurement_not_allowed' do
    it 'throws a warning when it detects use of px measurements' do
      myfile.access_file('../../tester_file/spec_test.css')
      expect(myfile.px_measurement_not_allowed).to eql(['10px is not allowed in div. Please use rems,ems or percentage units.'.colorize(:red)])
    end
  end

  describe '#declaration_limit_10' do
    it 'throw a warning when over 10 declarations are used' do
      myfile.access_file('../../tester_file/spec_test.css')
      expect(myfile.declaration_limit_10).to eql('Test passed for 10 declarations or less'.colorize(:green))
    end
  end

  describe '#id_limit_4' do
    it 'throws a warning when you use more than four ids' do
      myfile.access_file('../../tester_file/spec_test.css')
      expect(myfile.id_limit_4).to eql('Test passed for four ids or less'.colorize(:green))
    end
  end

  describe '#selector_names_lowercase' do
    it 'throws error when you capitalize selector names' do
      myfile.access_file('../../tester_file/spec_test.css')
      expect(myfile.selector_names_lowercase).to eql(['Do not use a capitalized class identifier, .Help'.colorize(:red)])
    end
  end

  describe '#selector_names_disallowed' do
    it 'throws error when you use html as a class identifier' do
      myfile.access_file('../../tester_file/spec_test.css')
      expect(myfile.selector_names_disallowed).to eql(['You are not supposed to use .html as a class/id identifier.'.colorize(:red)])
    end
  end
end

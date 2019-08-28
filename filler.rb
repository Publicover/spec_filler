# require './schema.txt'

def fill_factory(column, factory_name='')

  class_name = column.split('_').map(&:capitalize).join
  line_array = []
  next_line = false
  
  File.foreach('schema.txt') do |line|
    if line.chomp.empty? && next_line == true
      break
    end
    if next_line 
      line_array << line 
    end
    if line.include?(column)
      line_array << line unless line.include?('add_index')
      next_line = true
    end
  end
  # line_array.delete("#{column}")
  # 
  # puts line_array[0]
  File.open("#{column}.rb", 'w') do |file|
    unless factory_name.empty?
      file.print("\FactoryGirl.define do\nfactory :#{factory_name}, class: #{class_name} do\n")
    else 
      file.print("FactoryGirl.define do\n\tfactory :#{column} do\n")
    end
    if line_array[0].include?('primary_key') 
      file.print("\t\t# It looks like your primary key isn't the record ID.\n")
      file.print("\t\t# Don't forget to pass in your primary key when you're creating\n")
      file.print("\t\t# the test object (e.g., create(:object, primary_key: column_name)).\n")
    end
    line_array.shift
    get_attributes(line_array).each do |attr|
      file.print "\t\t#{attr}\n"
    end
    file.print("\tend\n")
    file.print('end')
  end
end

def get_attributes(ary)
  stripped_ary = []
  ary.each do |char|
    stripped_ary << char.scan(/"([^"]*)"/)
  end
  stripped_ary.flatten
end

fill_factory('customers')

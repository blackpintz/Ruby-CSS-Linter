module Stylelint_methods
  def hash_decl(el)
    decl = el[0]
    new_hash = {}
    arr = decl.split(';')
    arr.each do |obj|
      split_obj = obj.split(':')
      new_hash[split_obj[0].strip.to_sym] = split_obj[1].strip
    end
    new_hash
  end
end

def definition_to_s(object, attributes)
  string = "define #{object}{\n"

  attributes.each do |key, value|
    if value.is_a?(Array)
      value = value.join(",")
    end
    string += "  #{key} #{value}\n"
  end
  string += "}\n"
  return string
end

def icinga_boolean(attribute)
  if attribute.is_a?(TrueClass)
    result = 1
  elsif attribute.is_a?(FalseClass)
    result = 0
  elsif attribute.is_a?(Integer) && ( attribute == 1 || attribute == 0 )
    result = attribute
  else
    raise("Incorrect value!")
  end
  return attribute
end

def center_of(str)
  string = str.chars
  until string.count <= 2
    string.slice!(0)
    string.slice!(-1)
  end
  string.join
end

center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'

def center_of(str)
  center_index = str.size / 2
  if str.size.odd?
    str[center_index]
  else
    str[center_index -1, 2]
  end
end
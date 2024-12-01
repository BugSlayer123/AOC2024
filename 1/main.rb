def quick_sort(array)
  return array if array.length <= 1
  
  pivot = array.shift
  left = array.select { |x| x < pivot }
  right = array.select { |x| x >= pivot }
  
  quick_sort(left) + [pivot] + quick_sort(right)
end
file_content = File.read('1/input.txt')

first_column = []
second_column = []

file_content.each_line do |line|
  col1, col2 = line.split.map(&:to_i)

  first_column << col1
  second_column << col2
end

puts quick_sort(first_column).zip(quick_sort(second_column)).map { |a, b| (a - b).abs }.sum


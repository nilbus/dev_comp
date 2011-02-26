def median(num_list)
  num_list.sort!
  
  #if the list is of an odd-numbered size
  index = num_list.size / 2 + 1
  return num_list[index-1]

end

num_sets = $stdin.gets.strip.to_i

num_sets.times do
  info_line = $stdin.gets.strip.split
  info_line = info_line.map{ |x| x.to_i}

  dataset_number = info_line.first
  num_nums = info_line[1]

  info_line = $stdin.gets.strip.split
  nums = info_line.map{ |x| x.to_i}

  l = []
  medians = []

  print_flag = true

  (0..num_nums).each do |index|
    num = nums[index]
    l.push(num)

    if(print_flag)
      medians.push(median(l))
      print_flag = false
    else
      print_flag = true
    end
  end

  unless nums.empty?
    puts dataset_number.to_s + " " + medians.size.to_s
    puts medians.join(" ")
  end

end



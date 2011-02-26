def median(num_list)
  num_list.sort!
  
  #if the list is of an odd-numbered size
  if(num_list.size % 1)
    index = num_list.size / 2 + 1
    return num_list[index-1]
  else
    return (num_list[num_list.size - 1] + num_list[num_list.size]) / 2
  end

end

num_sets = $stdin.gets.strip.to_i

1.upto num_sets do |set_num|
  info_line = $stdin.gets.strip.split
  info_line = info_line.map{ |x| x.to_i}

  info_line = $stdin.gets.strip.split
  nums = info_line.map{ |x| x.to_i}

  l = []
  medians = []

  print_flag = true

  nums.each do |num|
    l.push(num)
    if(print_flag)
      medians.push(median(l))
      print_flag = false
    else
      print_flag = true
    end
  end

  puts set_num.to_s + " " + medians.size.to_s
  puts medians.join(" ")

  


end



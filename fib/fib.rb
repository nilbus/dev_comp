def fib(num)
  if(num == 1)
    return 1
  elsif (num == 2)
    return 2
  else
    return fib(num-1) + fib(num-2)
  end
end

class Fib
  @@nums = [1, 2]

  def self.get(num)
    #Get the number of fibbonachi numbers less than num
    while(@@nums.last < num)
      @@nums.push(@@nums[-1] + @@nums[-2])
    end

    count = 0
    while(@@nums[count] < num)
      count += 1
    end

    return count
  end
end

def fib_range(a, b)
  fib(b) - fib(a)
end

#puts fib_range(100, 10)
#puts fib_range(9876543210, 1234567890)

def main
  input = STDIN.read.each_line.to_a
  input.shift # Discard first line
  while input.any?
    a, b = input.first.split.map{ |i| i.to_i }
    puts (Fib.get(b) - Fib.get(a))
    input.shift
  end
end

main

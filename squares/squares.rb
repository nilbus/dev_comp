#!/usr/bin/env ruby

def main
  input = STDIN.read.each_line.to_a

  $squares = (0..Math.sqrt(2147483647).to_i).map{|x|x*x}
  
  input = input.map &:to_i
  input.each do |target|
    find_squares(target)
  end
end

def find_squares(target)
  squares = $squares
  squares2 = squares.dup

  results = 0

  squares.each_with_index do |a, i|
    squares2.each do |b|
      if a + b == target
        results += 1
      end
      break if b > target
    end
    squares2.shift # discard first to get rid of redundant checks
    break if a > target
  end
  
  puts results
end

def log(msg)
  STDERR.write("#{msg}\n")
end
main

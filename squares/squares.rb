#!/usr/bin/env ruby

def main
  input = STDIN.read.each_line.to_a
  input.shift #ignore count

  $squares = (0..Math.sqrt(2147483647).to_i).map{|x|x*x}
  
  input = input.map &:to_i
  input.each do |target|
    find_squares(target)
  end
end

def find_squares(target)
  sqrt = Math.sqrt(target).to_i
  squares = $squares

  results = 0
  
  sqrt.downto(0).each do |i|
    foo = Math.sqrt(target-i**2)
    if foo == foo.to_i and foo**2 + i**2 == target
      results += 0.5
    end
  end
  
  puts results.ceil
end

def log(msg)
  STDERR.write("#{msg}\n")
end
main

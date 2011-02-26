#!/usr/bin/env ruby

require './lib/linked_list'

def main
  input = STDIN.each_line
  input.to_a.shift # Discard first line
  input.each do |line|
    n,k = line.split.map &:to_i
    raise 'expected n to be integer' unless n.is_a? Fixnum
    raise 'expected k to be integer' unless k.is_a? Fixnum
    play_game(n, k)
  end
end

def play_game(n, k)
  circle = LinkedList.new
  (1..n).each {|i| circle.addLast(i.to_s)}
  circle
end

main

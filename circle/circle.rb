#!/usr/bin/env ruby

require './lib/linked_list'

def main
  log 'main'
  input = STDIN.read.each_line.to_a
  input.shift # Discard first line
  input.each do |line|
    n,k = line.split.map{|i|i.strip.to_i}
    log "n: #{n.inspect} k: #{k.inspect}"
    raise "expected n to be integer #{n.inspect}" unless n.is_a? Fixnum
    raise "expected k to be integer #{k.inspect}" unless k.is_a? Fixnum
    play_game(n, k)
  end
end

def play_game(n, k)
  # build circle
  circle = LinkedList.new
  (1..n).each {|i| circle.addLast(i.to_s)}

  # remove people until winner is found
  current = circle.first_node
  (1..n-1).each do |i|
    log "round #{i}"
    (1..k).each do |j|
      current = current.next
      current = current.next if current.object.nil? # there's one node that is the null node
    end
    # remove and print current node
    current.prev.next = current.next
    current.next.prev = current.prev
    log "removing #{current.object}"
    current = current.next
    current = current.next if current.object.nil? # there's one node that is the null node
  end

  # print the winner
  puts circle.first
end

def log(msg)
  STDERR.write("#{msg}\n")
end
main

#!/usr/bin/env ruby
require 'pp'

def main
  input = STDIN.read.each_line.to_a
  input.shift # Discard first line
  while input.any?
    test_case input
  end
end

def test_case(input)
  group_count, table_count = input.shift.split.map &:to_i
  group_sizes = input.shift.split.map(&:to_i)
  table_sizes = input.shift.split.map(&:to_i)
  tables = []

  # Intitalize tables
  table_sizes.each_with_index do |size, index|
    tables << {:number => index, :size => size, :people => []}
  end
  tables = tables.sort_by{|a|a[:size] - a[:people].size}.reverse
  
  # loop through the groups
  group_sizes.each_with_index do |group_size, group_number|
    current_table_number = 0
    table = tables[current_table_number]
    # loop through the people in this group
    group_size.times do
      # If there's room at the first table
      if (table[:size] - table[:people].size) > 0
        table[:people] << group_number + 1
        current_table_number += 1
        if current_table_number > table_count
          puts "0"
          return
        end
        table = tables[current_table_number]
      else
        puts "0"
        return
      end
    end
    # resort tables, emptiest first
    tables = tables.sort_by{|a|a[:size] - a[:people].size}.reverse
  end
  puts "1"
  # successfully seated
  (0..group_count).each do |group|
    table_nums = []
    tables.each do |table|
      if table[:people].include? (group + 1)
        table_nums << "#{table[:number]+1} "
      end
    end
    puts table_nums.map(&:to_i).sort.join ' ' unless table_nums.empty?
  end
end

def log(msg)
  STDERR.write("#{msg}\n")
end

main

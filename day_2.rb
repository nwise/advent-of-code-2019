input = %w(1 0 0 3 1 1 2 3 1 3 4 3 1 5 0 3 2 13 1 19 1 6 19 23 2 23 6 27 1 5 27 
31 1 10 31 35 2 6 35 39 1 39 13 43 1 43 9 47 2 47 10 51 1 5 51 55 1 55 10 59 2 
59 6 63 2 6 63 67 1 5 67 71 2 9 71 75 1 75 6 79 1 6 79 83 2 83 9 87 2 87 13 91 
1 10 91 95 1 95 13 99 2 13 99 103 1 103 10 107 2 107 10 111 1 111 9 115 1 115 2 
119 1 9 119 0 99 2 0 14 0).map(&:to_i)
input.freeze

example = [1,9,10,3,2,3,11,0,99,30,40,50]
result =  [1,9,10,70,2,3,11,0,99,30,40,50]

def run(program, noun, verb)
  current_index = 0
  program[1] = noun
  program[2] = verb

  while true do
    op     = program[current_index]
    noun   = program[program[current_index+1]]
    verb   = program[program[current_index+2]]
    output = program[current_index+3]
    result = nil

    case op
    when 1 # Add
      result = noun + verb
    when 2 # Multiply
      result = noun * verb
    when 99 # Exit
      return program
    end

    program[output] = result
    current_index += 4
  end
rescue NoMethodError
  puts "Invalid input: could not halt"
end

puts "Example:  #{run(example, 9, 10)[0]}" # 3500
puts "Answer 1: #{run(input.dup, 12, 2)[0]}" # 3850704

# Brute force it!
(0..99).each do |noun|
  (0..99).each do |verb|
    program = input.dup
    answer = run(program, noun, verb)[0]
    if answer == 19690720
      puts "Answer 2: 100 * #{noun} + #{verb} = #{(100 * noun) + verb} "
      return # stop
    end
  end
end

puts "Done."

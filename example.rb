class Example
  def initialize(input: $stdin, output: $stdout)
    @input = input
    @output = output
  end

  def ask_for_number
    @output.puts 'Input an integer 5 or above'
    loop do
      input = @input.gets.to_i
      return true if input >= 5

      @output.puts 'Invalid. Try again:'
    end
  end
end

class Example
  def ask_for_number
    puts 'Input an integer 5 or above'
    loop do
      input = gets.to_i
      return true if input >= 5

      puts 'Invalid. Try again:'
    end
  end
end

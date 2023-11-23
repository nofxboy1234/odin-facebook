require 'stringio'

require './example'

RSpec.describe Example do
  context 'with input greater than 5' do
    it 'asks for input only once' do
      output = ask_for_number_with_input(6)

      expect(output).to eq "Input an integer 5 or above\n"
    end
  end

  context 'with input equal to 5' do
    it 'asks for input only once' do
      output = ask_for_number_with_input(5)

      expect(output).to eq "Input an integer 5 or above\n"
    end
  end

  context 'with input less than 5' do
    it 'asks repeatedly, until a number 5 or greater is provided' do
      output = ask_for_number_with_input(2, 3, 6)

      expect(output).to eq <<~OUTPUT
        Input an integer 5 or above
        Invalid. Try again:
        Invalid. Try again:
      OUTPUT
    end
  end

  def ask_for_number_with_input(*input_numbers)
    input = StringIO.new(input_numbers.join("\n") + "\n")
    output = StringIO.new

    example = Example.new(input: input, output: output)
    expect(example.ask_for_number).to be true

    output.string
  end
end
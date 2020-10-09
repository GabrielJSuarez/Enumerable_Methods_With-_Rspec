require './bin/main'

describe Enumerable do
  let(:arr) { [1, 2, 3] }
  let(:range) { (1..3) }
  let(:block) { proc { |x, y| "#{x}, #{y}" } }

  describe '.my_each_with_index' do
    context '#my_each_with_index behaviour' do
      example 'behaves has .each_with_index, takes an array' do
        expect(arr.my_each_with_index(&block)).to eq(arr.each_with_index(&block))
      end

      example 'behaves has .each_with_index, takes a range' do
        expect(range.my_each_with_index(&block)).to eq(range.each_with_index(&block))
      end
    end

    context '.my_each_with_index returning values' do
      example 'Returns and array when a block is passed' do
        expect(range.my_each_with_index(&block)).to eq(range)
      end
      example 'Returns an enumerator when no block is passed' do
        expect(range.my_each_with_index).to be_an Enumerator
      end
    end
  end
end

# frozen_string_literal: true

require './bin/enumerable'

describe Enumerable do
  let(:arr) { [1, 2, 3] }
  let(:range) { (1..5) }
  let(:rep_arr) { [1, 2, 4, 2] }

  describe '.my_count' do
    context '#my_count behaviour' do
      example 'behaves has .count and takes no argument' do
        expect(arr.my_count).to eq(arr.count)
      end

      example 'return the number of arguments' do
        expect(arr.my_count).to eq(3)
      end

      example 'given an argument returns the number of elements eq ot it' do
        expect(rep_arr.my_count(2)).to eq(2)
      end

      example 'when block given return the number of elements yielding true' do
        expect(rep_arr.my_count(&:even?)).to eq(3)
      end
    end
  end
end

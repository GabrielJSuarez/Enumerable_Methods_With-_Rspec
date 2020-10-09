# frozen_string_literal: true

require './bin/script.rb'

describe Enumerable do
  let(:arr) { [1, 2, 3] }
  let(:range) { (1..3) }
  let(:block) { proc { |x| (x + 1).to_s } }

  describe '.my_each' do
    context '#my_each behaviour' do
      example 'behaves has .each, takes an array' do
        expect(arr.my_each(&block)).to eq(arr.each(&block))
      end

      example 'behaves has .each, takes a range' do
        expect(range.my_each(&block)).to eq(range.each(&block))
      end
    end

    context '.my_each returning values' do
      example 'Returns and array when a block is passed' do
        expect(range.my_each(&block)).to eq(range)
      end
      example 'Returns an enumerator when no block is passed' do
        expect(arr.my_each).to be_an Enumerator
      end
    end
  end
end

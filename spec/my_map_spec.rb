# frozen_string_literal: true

require './bin/main'

describe Enumerable do
  let(:arr) { [1, 2, 3] }
  let(:range) { (1..5) }
  let(:block) { proc { |i| i * i } }

  describe '.my_map' do
    context '#my_map behaviour' do
      example 'behaves has .map, takes a block' do
        expect(arr.my_map { |x| x * x }).to eq(arr.map { |x| x * x })
      end

      example 'behaves has .map, takes a Proc' do
        expect(arr.my_map(&block)).to eq(arr.map(&block))
      end

      example 'if no block given, return enumerator' do
        expect(arr.my_map).to be_an Enumerator
      end
    end

    context '#my_map return values' do
      example 'Takes a block, returns the new array' do
        expect(arr.my_map { |x| x * x }).to eq([1, 4, 9])
      end

      example 'Takes a Proc, returns the new array' do
        expect(arr.my_map(&block)).to eq([1, 4, 9])
      end
    end
  end
end

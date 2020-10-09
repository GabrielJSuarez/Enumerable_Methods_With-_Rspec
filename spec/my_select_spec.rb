# frozen_string_literal: true

require './bin/enumerable'

describe Enumerable do
  let(:arr) { [1, 2, 3] }
  let(:range) { (1..3) }
  let(:block) { proc { |x| x > 1 } }

  describe '.my_select' do
    context '#my_select behaviour' do
      example 'behaves has .select, takes an array' do
        expect(arr.my_select(&block)).to eq(arr.select(&block))
      end

      example 'behaves has .select, takes a range' do
        expect(range.my_select(&block)).to eq(range.select(&block))
      end
    end

    context '.my_select returning values' do
      example 'Returns and array when a block is passed' do
        expect(range.my_select(&block)).to eq([2, 3])
      end
      example 'Returns an enumerator when no block is passed' do
        expect(range.my_select).to be_an Enumerator
      end
    end
  end
end

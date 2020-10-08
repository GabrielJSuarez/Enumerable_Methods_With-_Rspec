# frozen_string_literal: true

require './bin/script.rb'

describe Enumerable do
  let(:arr) { [1, 2, 3] }
  let(:range) { (1..3) }

  describe '.my_each' do
    context '#my_each behaviour' do
      example 'behaves has .each, takes an array' do
        expect(arr.my_each { |x| (x + 1).to_s }).to eq(arr.each { |x| (x + 1).to_s })
      end

      example 'behaves has .each, takes a range' do
        expect(range.my_each { |x| (x + 1).to_s }).to eq(range.each { |x| (x + 1).to_s })
      end
    end

    context '.my_each returning values' do
      example 'Returns and array when a block is passed' do
        expect(range.my_each { |x| (x + 1).to_s }).to eq(range)
      end
      example 'Returns an enumerator when no block is passed' do
        expect(arr.my_each).to be_an Enumerator
      end
    end
  end
end


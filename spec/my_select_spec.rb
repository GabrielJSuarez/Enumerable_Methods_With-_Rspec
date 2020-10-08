# frozen_string_literal: true

require './bin/script.rb'

describe Enumerable do
    let(:arr) { [1, 2, 3] }
    let(:range) { (1..3) }
  
    describe '.my_select' do
      context '#my_select behaviour' do
        example 'behaves has .select, takes an array' do
          expect(arr.my_select { |x| x > 1 }).to eq(arr.select { |x| x > 1 })
        end
  
        example 'behaves has .select, takes a range' do
          expect(range.my_select { |x| x > 1 }).to eq(range.select { |x| x > 1 })
        end
      end
  
      context '.my_select returning values' do
        example 'Returns and array when a block is passed' do
          expect(range.my_select { |x| x > 1 }).to eq([2, 3])
        end
        example 'Returns an enumerator when no block is passed' do
          expect(range.my_select).to be_an Enumerator
        end
      end
    end
  end
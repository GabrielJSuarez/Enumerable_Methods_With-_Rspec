# frozen_string_literal: true

require './bin/main'

# rubocop:disable Metrics/BlockLength

describe Enumerable do
  let(:arr) { [1, 2, 3] }
  let(:block) { proc { |x, y| x + y } }
  let(:block_conditions) { proc { |x, y| x > y ? x : y } }

  describe '.my_inject' do
    context '#my_inject behaviour' do
      example 'behaves has .inject, takes a block' do
        expect(arr.my_inject { |x, y| x + y }).to eq(arr.inject { |x, y| x + y })
      end

      example 'behaves has .inject, takes a symbol' do
        expect(arr.my_inject(:+)).to eq(arr.inject(:+))
      end

      example 'behaves has .inject, takes a block and a initial value' do
        expect(arr.my_inject(5) { |x, y| x + y }).to eq(arr.inject(5) { |x, y| x + y })
      end

      example 'behaves has .inject, takes a symbol and a initial value' do
        expect(arr.my_inject(5, :+)).to eq(arr.inject(5, :+))
      end

      example 'behaves has .inject, check conditions' do
        expect(arr.my_inject { |x, y| x > y ? x : y }).to eq(arr.inject { |x, y| x > y ? x : y })
      end
    end

    context '.my_inject return values' do
      example 'takes a block, return a single value' do
        expect(arr.my_inject(&block)).to eq(6)
      end

      example 'takes a symbol, return a single value' do
        expect(arr.my_inject(:+)).to eq(6)
      end

      example 'takes a block and a initial value, return a single value' do
        expect(arr.my_inject(5,&block)).to eq(11)
      end

      example 'takes a symbol and a initial value, return a single value' do
        expect(arr.my_inject(10, :+)).to eq(16)
      end

      example 'check conditions, return a single value' do
        expect(arr.my_inject(&block_conditions)).to eq(3)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength

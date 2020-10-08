# frozen_string_literal: true

require './bin/script.rb'

# rubocop:disable Metrics/BlockLength

describe Enumerable do
  let(:arr) { [1, 2, 3] }
  let(:range) { (1..3) }
  let(:arr_falsy) { [1, 2, nil] }

  describe '.my_all' do
    context '#my_all behaviour' do
      example 'behaves has .all?, takes an array, evaluates to true' do
        expect(arr.my_all? { |x| x > 0 }).to eq(arr.all? { |x| x > 0 })
      end

      example 'behaves has .all?, takes a range, evaluates to false' do
        expect(range.my_all? { |x| x > 1 }).to eq(range.all? { |x| x > 1 })
      end
    end

    context '.my_all returning values with/out block given' do
      example 'Returns true when every condition is met' do
        expect(range.my_all? { |x| x > 0 }).to eq(true)
      end

      example 'Returns false when every condition is noy met' do
        expect(range.my_all? { |x| x > 1 }).to eq(false)
      end

      example 'When block given return true if all elements are truthy' do
        expect(range.my_all?).to eq(true)
      end

      example 'When block given return false if an element is falsy' do
        expect(arr_falsy.my_all?).to eq(false)
      end
    end

    context '.my_all returning values with a Numeric pattern given' do
      let(:arr_numeric_true) { [1, 2.0, 1i] }
      let(:arr_numeric_false) { [1, 2.0, 'hello'] }

      example 'Returns true when every element is Numeric' do
        expect(arr_numeric_true.my_all?(Numeric)).to eq(true)
      end

      example 'Returns false when every element not is Numeric' do
        expect(arr_numeric_false.my_all?(Numeric)).to eq(false)
      end
    end

    context '.my_all returning values with a Regexp pattern given' do
      let(:arr_regexp_true) { %w[hello hi hola] }
      let(:arr_regexp_false) { %w[ola olla hola] }

      example 'Returns true when every element is Regexp' do
        expect(arr_regexp_true.my_all?(/h/)).to eq(true)
      end

      example 'Returns false when every element not is Regexp' do
        expect(arr_regexp_false.my_all?(/h/)).to eq(false)
      end
    end

    context '.my_all returning values when an empty array is passed' do
      example 'Returns true with an empty array' do
        expect([].my_all?).to eq(true)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength

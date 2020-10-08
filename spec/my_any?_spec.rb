# frozen_string_literal: true

require './bin/script.rb'

# rubocop:disable Metrics/BlockLength

describe Enumerable do
  let(:arr) { [1, 2, 3] }
  let(:range) { (1..3) }
  let(:arr_truthy) { [true, false, nil] }
  let(:arr_falsy) { [false, false, nil] }

  describe '.my_any?' do
    context '#my_any? behaviour' do
      example 'behaves has .any?, takes an array, evaluates to true' do
        expect(arr.my_any? { |x| x > 1 }).to eq(arr.any? { |x| x > 1 })
      end

      example 'behaves has .any?, takes a range, evaluates to false' do
        expect(range.my_any? { |x| x > 4 }).to eq(range.any? { |x| x > 4 })
      end
    end

    context '.my_any? returning values with/out block given' do
      example 'Returns true when some conditions are met' do
        expect(range.my_any? { |x| x > 1 }).to eq(true)
      end

      example 'Returns false when not one condition is met' do
        expect(range.my_any? { |x| x > 4 }).to eq(false)
      end

      example 'When block given return true if some elements are truthy' do
        expect(arr_truthy.my_any?).to eq(true)
      end

      example 'When block given return false if no element is truthy' do
        expect(arr_falsy.my_any?).to eq(false)
      end
    end

    context '.my_any? returning values with a Numeric pattern given' do
      let(:arr_numeric_true) { [1, 'hello', 1.0] }
      let(:arr_numeric_false) { %w[hi hola hello] }

      example 'Behaves the same ass #any? with a Numeric pattern' do
        expect(arr_numeric_true.my_any?(Numeric)).to eq(arr_numeric_true.any?(Numeric))
      end

      example 'Returns true when some element are Numeric' do
        expect(arr_numeric_true.my_any?(Numeric)).to eq(true)
      end

      example 'Returns false when no element is NUmeric' do
        expect(arr_numeric_false.my_any?(Numeric)).to eq(false)
      end
    end

    context '.my_any? returning values with a Regexp pattern given' do
      let(:arr_regexp_true) { %w[hello hi hola] }
      let(:arr_regexp_false) { %w[ola olla hola] }

      example 'Behaves the same ass #any? with a regexp pattern' do
        expect(arr_regexp_true.my_any?(/o/)).to eq(arr_regexp_true.any?(/o/))
      end

      example 'Returns true when some element is matching the Regexp' do
        expect(arr_regexp_true.my_any?(/o/)).to eq(true)
      end

      example 'Returns false when no element matchs Regexp' do
        expect(arr_regexp_false.my_any?(/e/)).to eq(false)
      end
    end

    context '.my_any? returning values when an empty array is passed' do
      example 'Behaves the same ass #any? witn an empty array' do
        expect([].my_any?).to eq([].any?)
      end

      example 'Returns false with an empty array' do
        expect([].my_any?).to eq(false)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength

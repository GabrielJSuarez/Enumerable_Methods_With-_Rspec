# frozen_string_literal: true

require './bin/enumerable'

# rubocop:disable Metrics/BlockLength

describe Enumerable do
  let(:arr) { [1, 2, 3] }
  let(:range) { (1..3) }
  let(:arr_truthy) { [true, false, nil] }
  let(:arr_falsy) { [false, false, nil] }
  let(:block_true) { proc { |x| x > 4 } }
  let(:block_false) { proc { |x| x > 1 } }

  describe '.my_none?' do
    context '#my_none? behaviour' do
      example 'behaves has .none?, takes an array, evaluates to true' do
        expect(arr.my_none?(&block_true)).to eq(arr.none?(&block_true))
      end

      example 'behaves has .none?, takes a range, evaluates to false' do
        expect(range.my_none?(&block_false)).to eq(range.none?(&block_false))
      end
    end

    context '.my_none? returning values with/out block given' do
      example 'Returns true when no conditions are met' do
        expect(range.my_none?(&block_true)).to eq(true)
      end

      example 'Returns false when some condition are met' do
        expect(range.my_none?(&block_false)).to eq(false)
      end

      example 'When block given return true if no element is truthy' do
        expect(arr_falsy.my_none?).to eq(true)
      end

      example 'When block given return false if some element is truthy' do
        expect(arr_truthy.my_none?).to eq(false)
      end
    end

    context '.my_none? returning values with a Numeric pattern given' do
      let(:arr_numeric_true) { [1, 'hello', 1.0] }
      let(:arr_numeric_false) { %w[hi hola hello] }

      example 'Behaves the same ass #none? with a Numeric pattern' do
        expect(arr_numeric_false.my_none?(Numeric)).to eq(arr_numeric_false.none?(Numeric))
      end

      example 'Returns true when no element is Numeric' do
        expect(arr_numeric_false.my_none?(Numeric)).to eq(true)
      end

      example 'Returns false when some elements are NUmeric' do
        expect(arr_numeric_true.my_none?(Numeric)).to eq(false)
      end
    end

    context '.my_none? returning values with a Regexp pattern given' do
      let(:arr_regexp_true) { %w[hello hi hola] }
      let(:arr_regexp_false) { %w[ola olla hola] }

      example 'Behaves the same ass #none? with a regexp pattern' do
        expect(arr_regexp_true.my_none?(/u/)).to eq(arr_regexp_true.none?(/u/))
      end

      example 'Returns true when no element is matching the Regexp' do
        expect(arr_regexp_true.my_none?(/u/)).to eq(true)
      end

      example 'Returns false when some elements matches Regexp' do
        expect(arr_regexp_false.my_none?(/o/)).to eq(false)
      end
    end

    context '.my_none? returning values when an empty array is passed' do
      example 'Behaves the same ass #none? witn an empty array' do
        expect([].my_none?).to eq([].none?)
      end

      example 'Returns true with an empty array' do
        expect([].my_none?).to eq(true)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength

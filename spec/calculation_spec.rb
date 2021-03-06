require_relative '../calculation'

describe 'Calculation (Split Payments Task 1)' do
  it 'can run one times example' do
    extend Calculation

    expect(six(times(five))).to eq(30)
  end

  it 'can run one plus example' do
    extend Calculation

    expect(one(plus(nine))).to eq(10)
  end

  it 'can run one minus example' do
    extend Calculation

    expect(six(minus(three))).to eq(3)
  end

  it 'can run one divide_by example' do
    extend Calculation

    expect(eight(divided_by(two))).to eq(4)
  end

  it 'divide_by zero should error' do
    extend Calculation

    expect { eight(divided_by(zero)) }.to raise_error(ZeroDivisionError)
  end
end

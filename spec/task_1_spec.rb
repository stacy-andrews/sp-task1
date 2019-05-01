require_relative '../task_1'

describe 'Split Payments Task 1' do
  it 'can run one times example' do
    expect(six(times(five))).to eq(30)
  end

  it 'can run one plus example' do
    expect(one(plus(nine))).to eq(10)
  end

  it 'can run one plus example' do
    expect(one(plus(nine))).to eq(10)
  end

  it 'can run one minus example' do
    expect(six(minus(three))).to eq(3)
  end
end


require 'TDD'

describe 'my_uniq' do
  let(:array) {[1, 1, 2, 3]}
  let(:uniq_array) {my_uniq(array.dup)}

  it 'each element is unique' do
    expect(uniq_array).to eq([1, 2, 3])
  end

  it 'does not modify' do
    expect{my_uniq(array)}.to_not change{array}
  end

  it 'returns elements from the array' do 
    uniq_array.each do |ele|
      expect(array).to include(ele)
    end
  end

  it "should not call #uniq" do
    expect(array).to_not receive(:uniq)
    expect(array).to_not receive(:uniq!)
    my_uniq(array)
  end
end

describe "two_sum" do
  let(:array) {[-1, 0, 2, -2, 1]}
  let(:zeros) {array.two_sum}

  it 'works with an empty array' do 
    expect([].two_sum).to eq([])
  end

  it 'finds all zero-sum pairs' do
    expect(array.two_sum).to eq([[0, 4], [2, 3]])
  end

  it 'returns an empty array if no pairs found' do
    expect([1, 2, 3].two_sum).to eq([])
  end

  it 'does not modify original array' do
    expect{array.two_sum}.to_not change{array}
  end
end

describe 'my_transpose' do
  let(:array) {[
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ]}
  let(:transposed) {[
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9]
  ]}

  it 'works with empty array' do
    expect(my_transpose([[]])).to eq([[]])
  end

  it 'does not modify original' do
    expect{my_transpose(array)}.to_not change{array}
  end

  it 'returns transposed array' do
    expect(my_transpose(array)).to eq(transposed)
  end
end

describe 'stock_picker' do
  let(:array) {[2, 1, 5, 4]}
  let(:picked) {stock_picker(array)}
  let(:array2) {[2, 1, 5, 4, 0, 9]}

  it 'picks the best pair' do
    expect(picked).to eq([1, 2])
  end

  it 'picks a better pair if it finds one' do
    expect(stock_picker(array2)).to eq([4, 5])
  end

  it 'works on empty array' do
    expect(stock_picker([])).to eq([])
  end
end
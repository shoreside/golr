RSpec::Matchers.define :have_same_cell_states_as do |expected|
  match do |actual|
    # Having same sizes and making sure 'actual' has all keys that 'expected'
    # has plus values are identical means that the cell states are identical
    return false unless expected.size == actual.size
    matching = true
    expected.each do |key,value|
      # return false unless actual.has_key?(key) && actual[key] == value
      matching = false unless actual.has_key?(key) && actual[key] == value
      # break -> question here: why do we get the wrong result if we return false here (to be quick?)
    end
    # true
    matching
  end

  failure_message_for_should do |actual|
    "expected that #{actual} would be of identical dimensions and have same cell states as #{expected}"
  end

  failure_message_for_should_not do |actual|
    "expected that #{actual} would be of different dimensions or have different cell states as #{expected}"
  end

  description do
    "have living and dead cells in exactly the same positions as #{expected} and be of identical dimensions"
  end
end
RSpec::Matchers.define :have_same_cell_states_as do |expected_grid|
  match do |actual_grid|
    # Two grids having same sizes and making sure 'actual' has all keys that 'expected'
    # has plus values for these keys are identical means that all cell states are identical
    return false unless expected_grid.size == actual_grid.size
    matching = true
    expected_grid.each do |key,value|
      matching = false unless actual_grid.has_key?(key) && actual_grid[key] == value
    end
    matching
  end

  failure_message_for_should do |actual_grid|
    "expected that #{actual_grid} would be of identical dimensions and have same cell states as #{expected_grid}"
  end

  failure_message_for_should_not do |actual_grid|
    "expected that #{actual_grid} would be of different dimensions or have different cell states as #{expected_grid}"
  end

  description do
    "have living and dead cells in exactly the same positions as #{expected_grid} and be of identical dimensions"
  end
end
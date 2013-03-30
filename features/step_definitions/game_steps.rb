
Given /^a Game with this initial state$/ do |string|
  @game = Golr::GameReader.from_string(string)
end

When /^I evolve it to its next generation$/ do
  @game.evolve
end

Then /^the game should be in this state$/ do |string|
  # construct new Game from expected game state
  expected_game = Golr::GameReader.from_string(string)

  # print both games using StringIO to capture prints
  io_actual = StringIO.new
  io_expected = StringIO.new
  Golr::GamePrinter.print(expected_game, io_expected)
  Golr::GamePrinter.print(@game, io_actual)

  io_actual.string.should == io_expected.string
end
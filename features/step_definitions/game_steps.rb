
Given /^a Game with this initial state$/ do |string|
  @game = Golr::GameReader.from_string(string)
end

When /^I evolve it to its next generation$/ do
  @game.evolve
end

Then /^the game should be in this state$/ do |string|
  # construct new Game from expected game state
  test_game = Golr::GameReader.from_string(string)

  # print both games
  # use StringIO instances to capture print result
  io_actual = StringIO.new
  io_expected = StringIO.new
  Golr::GamePrinter.print(test_game, io_expected)
  Golr::GamePrinter.print(@game, io_actual)

  io_expected.string.should == io_actual.string
end
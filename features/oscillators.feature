Feature: Oscillators
  As a user of Golr
  I should be able to specify games that represent Oscillators
  And be able to verify that the cells oscillate between two or more states

  Scenario: Toad, an oscillaltor with period 2
    Given a Game with this initial state
    """
    |      |
    |      |
    |  ooo |
    | ooo  |
    |      |
    |      |
    """
    When I evolve it to its next generation
    Then the game should be in this state
    """
    |      |
    |   o  |
    | o  o |
    | o  o |
    |  o   |
    |      |
    """
    When I evolve it to its next generation
    Then the game should be in this state
    """
    |      |
    |      |
    |  ooo |
    | ooo  |
    |      |
    |      |
    """

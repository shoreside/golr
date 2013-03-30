Feature: Spaceships
  As a user of Golr
  I should be able to specify games that represent Spaceships
  And be able to verify that the active cells travel in stages from upper left to lower right ares of the game grid

  Scenario: 5-cell Glider
    Given a Game with this initial state
    """
    |          |
    |   o      |
    | o o      |
    |  oo      |
    |          |
    |          |
    |          |
    |          |
    |          |
    |          |
    """
    When I evolve it to its next generation
    Then the game should be in this state
    """
    |          |
    |  o       |
    |   oo     |
    |  oo      |
    |          |
    |          |
    |          |
    |          |
    |          |
    |          |
    """
    When I evolve it to its next generation
    Then the game should be in this state
    """
    |          |
    |   o      |
    |    o     |
    |  ooo     |
    |          |
    |          |
    |          |
    |          |
    |          |
    |          |
    """
    When I evolve it to its next generation
    Then the game should be in this state
    """
    |          |
    |          |
    |  o o     |
    |   oo     |
    |   o      |
    |          |
    |          |
    |          |
    |          |
    |          |
    """
    When I evolve it to its next generation
    Then the game should be in this state
    """
    |          |
    |          |
    |    o     |
    |  o o     |
    |   oo     |
    |          |
    |          |
    |          |
    |          |
    |          |
    """

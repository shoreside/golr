Feature: Spaceships
  As a user of Golr
  I should be able to specify games that represent Spaceships
  And be able to verify that the active cells travel across the grid and the original shape is repeated periodically

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

  Scenario: Lightweight spaceship (LWSS)
    Given a Game with this initial state
    """
    |              |
    |              |
    |    oo        |
    |  oo oo       |
    |  oooo        |
    |   oo         |
    |              |
    |              |
    |              |
    |              |
    |              |
    |              |
    |              |
    |              |
    """
    When I evolve it to its next generation
    Then the game should be in this state
    """
    |              |
    |              |
    |   oooo       |
    |  o   o       |
    |      o       |
    |  o  o        |
    |              |
    |              |
    |              |
    |              |
    |              |
    |              |
    |              |
    |              |
    """
    When I evolve it to its next generation
    Then the game should be in this state
    """
    |              |
    |    oo        |
    |   oooo       |
    |   oo oo      |
    |     oo       |
    |              |
    |              |
    |              |
    |              |
    |              |
    |              |
    |              |
    |              |
    |              |
    """
    When I evolve it to its next generation
    Then the game should be in this state
    """
    |              |
    |   o  o       |
    |       o      |
    |   o   o      |
    |    oooo      |
    |              |
    |              |
    |              |
    |              |
    |              |
    |              |
    |              |
    |              |
    |              |
    """
    When I evolve it to its next generation
    Then the game should be in this state
    """
    |              |
    |              |
    |      oo      |
    |    oo oo     |
    |    oooo      |
    |     oo       |
    |              |
    |              |
    |              |
    |              |
    |              |
    |              |
    |              |
    |              |
    """
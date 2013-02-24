Feature: Still lifes
  As a user of Golr
  I should be able to specify games that represent Still lifes
  And be able to verify that the cell states do not change between generations

  Scenario: Block
    Given a Game with this initial state
    """
    |    |
    | oo |
    | oo |
    |    |
    """
    When I evolve it to its next generation
    Then the game should be in this state
    """
    |    |
    | oo |
    | oo |
    |    |
    """

  Scenario: Beehive
    Given a Game with this initial state
    """
    |      |
    |  oo  |
    | o  o |
    |  oo  |
    |      |
    """
    When I evolve it to its next generation
    Then the game should be in this state
    """
    |      |
    |  oo  |
    | o  o |
    |  oo  |
    |      |
    """

  Scenario: Loaf
    Given a Game with this initial state
    """
    |      |
    |  oo  |
    | o  o |
    |  o o |
    |   o  |
    |      |
    """
    When I evolve it to its next generation
    Then the game should be in this state
    """
    |      |
    |  oo  |
    | o  o |
    |  o o |
    |   o  |
    |      |
    """

  Scenario: Boat
    Given a Game with this initial state
    """
    |     |
    | oo  |
    | o o |
    |  o  |
    |     |
    """
    When I evolve it to its next generation
    Then the game should be in this state
    """
    |     |
    | oo  |
    | o o |
    |  o  |
    |     |
    """

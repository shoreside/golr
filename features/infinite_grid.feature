Feature: Infinite (Folded) Grid
  As a user of Golr
  I should be able to verify that the game grid is folded at the edges
  And thereby gives the impression as if the grid were 'infinite'

  Scenario: Three adjacent life cells across edges of grid turn into still life
  Given a Game with this initial state
    """
    |     |
    |o   o|
    |o    |
    |     |
    """
    When I evolve it to its next generation
    Then the game should be in this state
    """
    |     |
    |o   o|
    |o   o|
    |     |
    """
    When I evolve it to its next generation
    Then the game should be in this state
    """
    |     |
    |o   o|
    |o   o|
    |     |
    """

  Scenario: One dead cell with three neighbors across the grid's edges comes to life, then all die
    Given a Game with this initial state
      """
      |     |
      |o    |
      |    o|
      |o    |
      |     |
      """
    When I evolve it to its next generation
    Then the game should be in this state
    """
    |     |
    |     |
    |o   o|
    |     |
    |     |
    """
    When I evolve it to its next generation
    Then the game should be in this state
    """
    |     |
    |     |
    |     |
    |     |
    |     |
    """

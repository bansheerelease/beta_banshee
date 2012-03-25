class FunController < ApplicationController

  # Set title for the page '/fun/pacman'
  def pacman
    @title = 'Pacman'
  end

  # Set title for the page '/fun/asteroids'
  def asteroids
    @title = 'Asteroids'
  end

end


-- Afficher les print au fur et a mesure
io.stdout:setvbuf('no')

-- pour le pixel art
love.graphics.setDefaultFilter("nearest")

-- debuguer pas a pas dans ZBStudio
if arg[#arg] == "-debug" then require("mobdebug").start () end

local myGame = require("game")

function love.load()
  
  love.window.setMode(1280,720)
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  myGame.Load()
end

function love.update(dt)
  
end

function love.draw()
  
  myGame.Draw()
  
end

function love.keypressed(key)
  
  print(key)
  
end
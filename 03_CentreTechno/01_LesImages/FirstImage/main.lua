local img
local largeur, hauteur

function love.load()
  img = love.graphics.newImage("images/personnage.png")
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  
  print("Largeur : ",largeur)
  print("hauteur : ",hauteur)
end

function love.draw()
  love.graphics.draw(img, largeur/2 - img:getWidth() /2, hauteur/2 - img:getHeight()/2)
end
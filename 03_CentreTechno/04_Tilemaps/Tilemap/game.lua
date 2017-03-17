local game = {}
local MAP_WIDTH = 10 -- ecrire en maj = pour ne pas y toucher, ce sont des constantes
local MAP_HEIGHT = 10
local TITLE_WIDTH = 70
local TITLE_HEIGHT = 70

game.Map = {}
game.Map = {
              { 3,3,3,3,3,3,3,3,3,3 },
              { 4,4,4,4,4,4,4,4,4,4 },
              { 5,5,5,5,5,5,5,5,5,5 },
              { 3,2,1,1,2,3,2,1,2,3 },
              { 3,2,3,5,3,3,2,3,2,3 },
              { 3,2,3,5,3,3,2,3,2,3 },
              { 1,1,1,1,1,1,1,1,1,1 },
              { 3,3,3,3,3,3,3,3,3,3 },
              { 3,3,3,3,3,3,4,4,4,4 },
              { 7,7,7,6,8,7,7,6,7,8 },
           }

game.TileTextures = {}

function game.Load()
  print("Game : Chargement des textures")
  game.TileTextures[0] = nil
  game.TileTextures[1] = love.graphics.newImage("img/grassCenter.png")
  game.TileTextures[2] = love.graphics.newImage("img/liquidLava.png")
  game.TileTextures[3] = love.graphics.newImage("img/liquidWater.png")
  game.TileTextures[4] = love.graphics.newImage("img/snowCenter.png")
  game.TileTextures[5] = love.graphics.newImage("img/stoneCenter.png")
  game.TileTextures[6] = love.graphics.newImage("img/mini_FlagsDark.jpg")
  game.TileTextures[7] = love.graphics.newImage("img/mini_FlagsLight.jpg")
  game.TileTextures[8] = love.graphics.newImage("img/mini_FlagsMid.jpg")
    
  print("Game : Chargement des textures terminé")
end

function game.Draw()
  local l, c
  
  for l = 1,MAP_HEIGHT do
    for c = 1, MAP_WIDTH do
      local id = game.Map[l][c]
      local texture = game.TileTextures[id]
      if texture ~= nil then
        love.graphics.draw(texture, (c-1) * TITLE_WIDTH, (l-1) * TITLE_HEIGHT)
      end
    end
  end
  
  -- Trouver l'id (index) de la Tile de la map
  local xMouse = love.mouse.getX() -- Pos X de la souris
  local yMouse = love.mouse.getY() -- Pos Y
  local col = math.floor(xMouse / TITLE_WIDTH) + 1 --Sur quelle colonne on est -- math.floor = valeur entiere, sans virgule
  local lig = math.floor(yMouse / TITLE_HEIGHT) + 1
    
  if col > 0 and col <= MAP_WIDTH and lig > 0 and lig <= MAP_HEIGHT then
    local id = game.Map[lig][col]
    love.graphics.print("ID :" ..tostring(id),1,1)
  else
    love.graphics.print("En dehors de la map", 1, 1)
  end
  -- Fin trouver id
   
end





return game
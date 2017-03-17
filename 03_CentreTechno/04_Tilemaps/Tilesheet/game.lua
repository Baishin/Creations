local game = {}
local MAP_WIDTH = 32 -- ecrire en maj = pour ne pas y toucher, ce sont des constantes
local MAP_HEIGHT = 23
local TILE_WIDTH = 32
local TILE_HEIGHT = 32

game.Map = {}
game.Map =  {
  {10, 10, 10, 10, 10, 10, 10, 10, 10, 61, 10, 13, 10, 10, 10, 10, 10, 10, 13, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15},
  {10, 10, 10, 10, 10, 11, 11, 11, 10, 10, 10, 13, 10, 10, 10, 10, 10, 10, 10, 14, 15, 15, 129, 15, 15, 15, 15, 15, 15, 68, 15, 15},
  {10, 10, 61, 10, 11, 19, 19, 19, 11, 10, 10, 13, 10, 10, 169, 10, 10, 10, 10, 13, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15},
  {10, 10, 10, 11, 19, 19, 19, 19, 19, 11, 10, 13, 10, 10, 10, 10, 10, 10, 10, 10, 13, 14, 15, 15, 15, 68, 15, 15, 15, 15, 15, 15},
  {10, 10, 10, 11, 19, 19, 19, 19, 19, 11, 10, 13, 10, 10, 10, 10, 10, 10, 61, 10, 10, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15},
  {10, 10, 61, 10, 11, 19, 19, 19, 11, 10, 10, 13, 10, 10, 10, 10, 10, 10, 10, 10, 10, 14, 15, 15, 129, 15, 15, 15, 68, 15, 129, 15},
  {10, 10, 10, 10, 10, 11, 11, 11, 10, 10, 61, 13, 10, 10, 10, 10, 10, 10, 10, 10, 10, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15},
  {10, 10, 10, 10, 10, 13, 13, 13, 13, 13, 13, 13, 10, 10, 10, 10, 10, 169, 10, 10, 10, 13, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15},
  {10, 10, 10, 10, 10, 10, 10, 10, 13, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 61, 10, 13, 14, 14, 14, 14, 14, 14, 14, 15, 129},
  {10, 10, 10, 10, 10, 10, 10, 10, 13, 55, 10, 58, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 13, 14, 14},
  {10, 10, 10, 10, 10, 10, 10, 10, 13, 10, 10, 10, 55, 10, 58, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10},
  {10, 10, 10, 10, 10, 10, 10, 10, 13, 10, 58, 10, 10, 10, 10, 10, 10, 169, 10, 10, 10, 10, 10, 10, 61, 10, 10, 10, 10, 10, 1, 1},
  {10, 10, 10, 10, 10, 10, 10, 10, 13, 10, 10, 10, 58, 10, 10, 10, 10, 10, 10, 10, 10, 61, 10, 10, 10, 10, 10, 10, 10, 1, 37, 37},
  {13, 13, 13, 13, 13, 13, 13, 13, 13, 10, 55, 10, 10, 10, 55, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 37, 37, 37},
  {10, 10, 10, 10, 13, 10, 10, 10, 10, 10, 10, 10, 55, 10, 10, 10, 10, 169, 10, 10, 10, 10, 10, 10, 10, 10, 1, 37, 37, 37, 37, 37},
  {10, 10, 10, 10, 13, 10, 10, 10, 10, 142, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 37, 37, 37, 37, 37, 37},
  {10, 10, 10, 10, 13, 10, 10, 10, 10, 10, 10, 10, 10, 142, 10, 10, 10, 10, 10, 10, 10, 169, 10, 10, 1, 37, 37, 37, 37, 37, 37, 37},
  {14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 1, 37, 37, 37, 37, 37, 37, 37},
  {14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 1, 37, 37, 37, 37, 37, 37, 37},
  {19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 1, 37, 37, 37, 37, 37, 37, 37},
  {20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 1, 37, 37, 37, 37, 37, 37},
  {21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 1, 37, 37, 37, 37},
  {21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 1, 37, 37, 37}
  }

game.TileSheet = nil
game.TileTextures = {} --ne contient plus des images mais des quad
game.TileTypes = {} -- le type de texture. la table qui va permettre de classer les id par un nom

function game.Load()
  print("Game : Chargement des textures")
  
  game.TileSheet = love.graphics.newImage("img/tilesheet.png")
  
  local nbColumns = game.TileSheet:getWidth() / TILE_WIDTH
  local nbLines = game.TileSheet:getHeight() / TILE_HEIGHT 
  
  game.TileTextures[0] = nil -- on a besoin de dire qu'il n'y a pas de textures a 0
  
  local l, c
  local id = 1 --ici, id va etre le compteur sur l'image, il va attribuer un chiffre à la partie de la tilesheet qu'on veut
  
  for l = 1, nbLines  do
    for c = 1, nbColumns do
      
      game.TileTextures[id] = love.graphics.newQuad( --newQuad nous demande la position en du tile en x, en y, la taille en x, en y, largeur et hauteur de l'img complete
      (c-1)*TILE_WIDTH,
      (l-1)*TILE_HEIGHT,
      TILE_WIDTH,
      TILE_HEIGHT,
      game.TileSheet:getWidth(),
      game.TileSheet:getHeight()
      )
      id = id + 1
      
    end    
  end
  
  game.TileTypes[10] = "Herbe"
  game.TileTypes[11] = "Herbe Foncee"
  game.TileTypes[13] = "Sable"
  game.TileTypes[14] = "Sable mid"
  game.TileTypes[15] = "Sable Hard"
  game.TileTypes[19] = "eau"
  game.TileTypes[20] = "eau mid"
  game.TileTypes[21] = "eau foncee"
  game.TileTypes[1] = "bitume"
  game.TileTypes[37] = "pierre lave"
  game.TileTypes[61] = "sapins"
  game.TileTypes[55] = "platane"
  game.TileTypes[58] = "platane mort"
  game.TileTypes[169] = "rocher"
  game.TileTypes[129] = "rocher noir"


  print("Game : Chargement des textures terminé")
end

function game.Draw()
  local l, c
  
  for l = 1,MAP_HEIGHT do
    for c = 1, MAP_WIDTH do
      local id = game.Map[l][c]
      local textureQuad = game.TileTextures[id]
      if textureQuad ~= nil then
        love.graphics.draw(game.TileSheet, textureQuad, (c-1) * TILE_WIDTH, (l-1) * TILE_HEIGHT) --on ajoute le tilesheet pcq lua le demande pour afficher un quad
      end
    end
  end
  
  -- Trouver l'id (index) de la Tile de la map
  local xMouse = love.mouse.getX() -- Pos X de la souris
  local yMouse = love.mouse.getY() -- Pos Y
  local col = math.floor(xMouse / TILE_WIDTH) + 1 --Sur quelle colonne on est -- math.floor = valeur entiere, sans virgule
  local lig = math.floor(yMouse / TILE_HEIGHT) + 1
    
  if col > 0 and col <= MAP_WIDTH and lig > 0 and lig <= MAP_HEIGHT then
    local id = game.Map[lig][col]
    love.graphics.print("Type de texture : " ..tostring(game.TileTypes[id],1,1).." ("..tostring(id).. ")" )
  else
    love.graphics.print("En dehors de la map", 1, 1)
  end
  -- Fin trouver id
   
end





return game
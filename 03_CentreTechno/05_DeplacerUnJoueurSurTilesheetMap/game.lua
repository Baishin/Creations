local game = {}

game.Map = {}
game.Map.Grid =  {
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

game.Map.MAP_WIDTH = 32 -- ecrire en maj = pour ne pas y toucher, ce sont des constantes
game.Map.MAP_HEIGHT = 23
game.Map.TILE_WIDTH = 32
game.Map.TILE_HEIGHT = 32

game.TileSheet = nil
game.TileTextures = {} --ne contient plus des images mais des quad
game.TileTypes = {} -- le type de texture. la table qui va permettre de classer les id par un nom

game.hero = require("hero") -- On va chercher la page hero pour le mettre dans cette page

-- GESTION DES COLLISIONS --


function game.Map.Collision(pID) -- pID = parametre ID
  local tileType = game.TileTypes[pID]
  
  if tileType == "eau foncee" or 
     tileType == "arbre" or 
     tileType == "rocher" then -- tant que je suis sur ces cases, return true (pour dire == collision, je ne peux pas avancer)
    return true
  end
  
  return false --sinon par défaut pas de collision
end

-- FIN GESTION DES COLLISIONS --

-- GESTION DES DEGATS DE MAP --

function game.Map.Dmg(pID)
  local tileType = game.TileTypes[pID]
  
  if tileType == "pierre lave" then
    return true
  end
  
  return false

end

function game.Load()
  print("Game : Chargement des textures")
  
  game.TileSheet = love.graphics.newImage("img/tilesheet.png")
  
  local nbColumns = game.TileSheet:getWidth() / game.Map.TILE_WIDTH
  local nbLines = game.TileSheet:getHeight() / game.Map.TILE_HEIGHT 
  
  game.TileTextures[0] = nil -- on a besoin de dire qu'il n'y a pas de textures a 0
  
  local l, c
  local id = 1 --ici, id va etre le compteur sur l'image, il va attribuer un chiffre à la partie de la tilesheet qu'on veut
  
  for l = 1, nbLines  do
    for c = 1, nbColumns do
      
      game.TileTextures[id] = love.graphics.newQuad( --newQuad nous demande la position en du tile en x, en y, la taille en x, en y, largeur et hauteur de l'img complete
      (c-1)*game.Map.TILE_WIDTH,
      (l-1)*game.Map.TILE_HEIGHT,
      game.Map.TILE_WIDTH,
      game.Map.TILE_HEIGHT,
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
  game.TileTypes[20] = "eau foncee"
  game.TileTypes[21] = "eau foncee"
  game.TileTypes[1] = "bitume"
  game.TileTypes[37] = "pierre lave"
  game.TileTypes[61] = "arbre"
  game.TileTypes[55] = "arbre"
  game.TileTypes[58] = "arbre"
  game.TileTypes[68] = "arbre"
  game.TileTypes[142] = "arbre"
  game.TileTypes[169] = "rocher"
  game.TileTypes[129] = "rocher"



  print("Game : Chargement des textures terminé")
end




function game.Update(dt)

  game.hero.Update(game.Map, dt)

end







function game.Draw()
  local l, c
  
  for l = 1,game.Map.MAP_HEIGHT do
    for c = 1, game.Map.MAP_WIDTH do
      local id = game.Map.Grid[l][c]
      local textureQuad = game.TileTextures[id]
      if textureQuad ~= nil then
        love.graphics.draw(game.TileSheet, textureQuad, (c-1) * game.Map.TILE_WIDTH, (l-1) * game.Map.TILE_HEIGHT) --on ajoute le tilesheet pcq lua le demande pour afficher un quad
      end
    end
  end
  
  -- AFFICHER LE HERO ET SA VIE
  
  game.hero.Draw(game.Map)
     
  -- Trouver l'id (index) de la Tile de la map
  local xMouse = love.mouse.getX() -- Pos X de la souris
  local yMouse = love.mouse.getY() -- Pos Y
  local col = math.floor(xMouse / game.Map.TILE_WIDTH) + 1 --Sur quelle colonne on est -- math.floor = valeur entiere, sans virgule
  local lig = math.floor(yMouse / game.Map.TILE_HEIGHT) + 1
    
  if col > 0 and col <= game.Map.MAP_WIDTH and lig > 0 and lig <= game.Map.MAP_HEIGHT then
    local id = game.Map.Grid[lig][col]
    love.graphics.print("Type de texture : " ..tostring(game.TileTypes[id],1,1).." ("..tostring(id).. ")" )
  else
    love.graphics.print("En dehors de la map", 1, 1)
  end
  -- Fin trouver id
   
end





return game
-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end


----------------------------------------------------------------------------------------------------
                                    -- ON ECRIT LE JEU --
----------------------------------------------------------------------------------------------------
math.randomseed(love.timer.getTime())

-- Creation du lvl 16*12 (tuiles de 64)

imgTuiles = {}

niveau = {}
table.insert(niveau, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
table.insert(niveau, { 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
table.insert(niveau, { 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
table.insert(niveau, { 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
table.insert(niveau, { 0, 0, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
table.insert(niveau, { 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0})
table.insert(niveau, { 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0})
table.insert(niveau, { 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0})
table.insert(niveau, { 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0})
table.insert(niveau, { 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 0, 0})
table.insert(niveau, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
table.insert(niveau, { 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3})

local n 
for n = 1,3 do
  imgTuiles[n] = love.graphics.newImage("img/tuile_"..n..".png")
end
  
  
-- Le hero
hero = {}

sonShoot = love.audio.newSource("sounds/shoot.wav", "static")

-- Listes d'éléments
liste_sprites = {}
liste_tirs = {}
liste_enemies = {}



function CreateSprite(pNomImage, pX, pY)
  
  sprite = {}
  sprite.x = pX
  sprite.y = pY
  sprite.supprimer = false
  sprite.image = love.graphics.newImage("img/".. pNomImage..".png")
  sprite.l = sprite.image:getWidth() 
  sprite.h = sprite.image:getHeight() 
  
  table.insert(liste_sprites, sprite)
  
  return sprite
  
end

function CreateEnemy(pType, pX, pY)
  
  local nomImage = ""
  
  if pType == 1 then
    nomImage = "enemy1"
  elseif pType == 2 then
    nomImage = "enemy2"
  elseif pType == 3 then
    nomImage = "enemy3"  
  end
    
  local enemy = CreateSprite(nomImage, pX, pY)
  
  if pType == 1 then
    enemy.vy = 2
    enemy.vx = 0
    
  elseif pType == 2 then
    enemy.vy = 2
    enemy.vx = 2
    local direction = math.random(1,2)
    if direction == 1 then
      enemy.vx = 1
    else
      enemy.vx = -1
    end
    
  elseif pType == 3 then
    enemy.vy = 0
    enemy.vx = 2
    
  end
  
  table.insert(liste_enemies, enemy)
end


function StartGame()
  hero.x = largeur/2
  hero.y = hauteur - hero.h * 2 
  
  -- Create enemies
  CreateEnemy(1, largeur/2, 100)
  CreateEnemy(2, largeur/3, 150)
  CreateEnemy(3, largeur - (1/4) * largeur, 50)
end


function love.load()
  
  love.window.setTitle("Fist Them Up !")
  love.window.setMode(1024,768)
  
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  hero = CreateSprite("hero", largeur / 2, hauteur / 2)
  
  
  StartGame()
  
end

function love.update(dt)
  
  if love.keyboard.isDown("d","right") then
    hero.x = hero.x + 5
  end
  
  if love.keyboard.isDown("q","left") then
    hero.x = hero.x - 5 
  end
  
  if love.keyboard.isDown("z","up") and hero.y >= 0 + hero.h  then
    hero.y = hero.y - 5 
  end
  
  if love.keyboard.isDown("s","down") and hero.y <= hauteur - 1.5 *hero.h then
    hero.y = hero.y + 5 
  end
  
  -- LES TIRS
  -- Comme il faut supprimer les tirs au fur et a mesure, on parcours la boucle for à l'envers pour ne pas créer de bug
  -- En effet, si je dois supprimer un tir en plein milieu de ma liste, la liste est décalée et les tirs suivants ceux supprimés ne seront pas vérifiés
  local n
  for n = #liste_tirs, 1, -1 do 
    local tir = liste_tirs[n]
    tir.y = tir.y + tir.v
    
    
    -- Supprimer les tirs s'ils sortent de l'écran
    -- Il faut supprimer les tirs de la liste de sprites et de la liste de tirs car les tirs restent en mémoire
    if tir.y < 0 or tir.y > hauteur then
      
      tir.supprime = true
      table.remove(liste_tirs, n)
      
    end
  end
  
  -- Supr des sprites
  for n = #liste_sprites, 1, -1 do 
    if liste_sprites[n].supprime == true then
      table.remove(liste_sprites, n)
    end
  end
  
  
  -- == Traitement des ennemis ==
  
  for n = #liste_enemies, 1, -1 do
    local enemy = liste_enemies[n]
    
    enemy.x = enemy.x + enemy.vx
    enemy.y = enemy.y + enemy.vy
    
    if enemy.y > hauteur or enemy.x > largeur or enemy.x < 0 then
      enemy.supprime = true
      table.remove(liste_enemies, n)
    end
  end
  
  -- == BONUS == --
  --A FAIRE : 
  -- - DOUBLE APPUI SUR Z == VITESSE PLUS RAPIDE, TEMPS DE RECHARGEMENT AVEC LE TEMPS
  -- - SI LE VAISSEAU DEPASSE UNE CERTAINE LIGNE, APPLIQUER UNE GRAVITE VERS LE BAS EXPONENTIELLE
  
  -- Si l'image sort de l'écran a droite + 1/4 de la taille du vaisseau alors il rentre par l'autre coté et vice versa
  if hero.x >= largeur + (hero.l/2) then
    hero.x = hero.x / hero.x - hero.l/2
  elseif hero.x <= 0 - (hero.l/2) then
    hero.x = largeur + hero.l /2
  end



end

function love.draw()
  
  -- afficher la map
  local ligne, colonne
  local x,y
  x = 0
  y = 0
  
  for ligne = 1, #niveau do -- Pour chaque ligne allant de la n°1 a la numéro max de la liste niveau
    for colonne = 1, #niveau[ligne] do -- et pour chaque colonne allant de la 1ere a la derniere des valeurs de chaque ligne de niveau
      
      local tuile = niveau[ligne][colonne]
      if tuile > 0 then
        love.graphics.draw(imgTuiles[tuile], x, y ,0 ,2 ,2)
      end
      x = x + 64
    end
    
    x = 0
    y = y + 64
  end
  
  
  -- Afficher les sprites  
  
  for n = 1, #liste_sprites do
    local s = liste_sprites[n]
    love.graphics.draw(s.image, s.x, s.y, 0, 2, 2, s.l /2, s.h /2)
  end
  
  -- Afficher les tirs en mémoire
  love.graphics.print("Nb de tirs en mémoire : "..#liste_tirs.. ". Nb sprites affichés : ".. #liste_sprites.. ". Nb ennemis : ".. #liste_enemies, 0, 0) 


end

-- Les touches qui ne s'appui qu'une seule fois : échap etc
function love.keypressed(key) 
  
  if key == "space" then
    local tir = CreateSprite("laser1", hero.x, hero.y - (hero.h *2) /2)
    tir.v = - 10
    table.insert(liste_tirs, tir)
    
    sonShoot:play()
  end

  print(key)
  
end
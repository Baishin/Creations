-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

-- Raquette
local pad = {} 
pad.x = 0
pad.y = 0
pad.hauteur = 15
pad.largeur = 90
pad.img = love.graphics.newImage("img/pad.png")

-- Balle
local ball = {} 
ball.x = 0
ball.y = 0
ball.rayon = 10 --en px
ball.sticked = false --collée a la raquette
ball.vx = 0 --vitesse x
ball.vy = 0 -- vitesse y
ball.img = love.graphics.newImage("img/mini_ball.png")
ball.size = 20

-- Briques
local brick = {}
brick.hauteur = 25
brick.largeur = 0

-- Lvl
local lvl = {}

-- UI
local ui = {}
ui.width = 0
ui.height = 0
ui.img = love.graphics.newImage("img/fondMenu.png")

-- Ligne de score
local line = {}
line.x = 0
line.y = 0
line.width = largeur
line.height = 1

-- Calcul du score
local score = {}
score.x = 1
score.y = 1
score.compteur = {}
score.compteur.nb = 0
score.compteur.upScore = false
score.compteur.brick = 150


-- Vie
local vie = {}
vie.nb = 0
vie.x = 1
vie.y = 1
vie.img = {}
vie.img.troisVie = love.graphics.newImage("img/troisVie.png")
vie.img.deuxVie = love.graphics.newImage("img/deuxVie.png")
vie.img.uneVie = love.graphics.newImage("img/uneVie.png")
vie.img.noVie = love.graphics.newImage("img/noVie.png")


function StartGame() -- debut du jeu
  -- La balle est collée au pad au début
  ball.sticked = true
  
  -- On initialise le nombre de vie
  vie.nb = 3
  
  -- On remet le score a 0
  score.compteur.nb = 0
  
  -- On initialise le lvl. Pour recommencer il faut le réinitialiser 
  -- Je veux 6 lignes de briques mais 1 libre pour afficher le menu et une autre libre pour la clarté
  lvl = {}
  local l, c 
    
  for l = 1, 8 do -- on parcours 8 briques en hauteur dont les deux 1eres ne seront pas affichées
    lvl[l] = {} -- pour chaque élément de ligne allant de 1 à 8, on crée un autre tableau allant de 1 à 15
      for c = 1, 15 do -- on parcours 15 briques en largeur
        lvl[l][c] = 1 -- On affiche un rectangle pour chaque ligne
        
        if lvl[1][c] == 1 or lvl[2][c] == 1 then -- mais si on est sur la ligne 1 et 2 alors on affiche pas
          lvl[l][c] = 0
        end
      end
  end
  
end


function love.load() -- Load execute qu'une seule fois
  -- Largeur et Hauteur de l'écran
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  print("largeur : "..largeur)
  print("hauteur : "..hauteur)
  
  -- On cache la souris
  local state = not love.mouse.isVisible() -- not == inverse
  love.mouse.setVisible(state)
  
  -- Load menu
  ui.width = largeur
  ui.height = 26
  
  -- Pos en Y du pad
  pad.y = hauteur - (pad.hauteur * 2)
  
  -- Config brick en largeur
  brick.largeur = largeur / 15 -- On veut 15 briques
  
  -- Pos de la ligne et config de la largeur
  line.y = hauteur - pad.hauteur 
  line.width = largeur
  
  -- Pos du compteur de score
  score.x = 1
  
  -- Pos de la vie 
  vie.x = largeur - 70
    
  StartGame()
  
end

function love.update(dt)-- met a jour les variables du jeu, executé 60fois/sec
  
  -- Raquette en x selon pos de la souris
  pad.x = love.mouse.getX() 
  
  -- Actions de la balle 
  -- La Balle est collée au pad au début
  if ball.sticked == true then
    ball.x = pad.x
    ball.y = pad.y - pad.hauteur / 2 - ball.rayon 
  else
  -- dt => nombre de sec qui s'est déroulé depuis le dernier update, env = a 60fois/sec. Si le donne une valeur 200 * dt, la balle fera 200px/sec
  -- si elle n'est pas collée, on lui donne une vitesse
    ball.x = ball.x + (ball.vx *dt) 
    ball.y = ball.y + (ball.vy * dt)
  end
  
  -- Si la balle rencontre une brique // COLLISION
  -- On prend la position de la balle qu'on divise par la largeur de la brique
  -- On imagine que la brique fasse 10 de large
  -- Si la balle est a la position x = 5, 5/10 = 0.5 (on va utiliser le math.floor() car on a pas de coordonnée avec des virgules) = 0
  -- Comme ne lua compte a partir de 0, il faut rajouter 1 pour dire qu'on est sur la case 1 (0 n'existe pas comme élément de tableau en lua)
  
  -- enregistrer la position de la balle en x
  local c = math.floor(ball.x / brick.largeur) + 1
  local l = math.floor(ball.y / brick.hauteur) + 1
  
  if l >= 3 and l <= #lvl and c >= 1 and c <= 15 then -- On vérifie qu'on soit bien à un endroit du tableau
    
    if lvl[l][c] == 1 then -- Si on est bien sur une brique alors
      ball.vy = 0 - ball.vy -- On fait en sorte que la balle ne rentre pas dans la brique pour la détruire      
      ball.y = ball.y + ball.rayon -- On inverse la direction de la balle
      lvl[l][c] = 0 -- On détruit la brique
      score.compteur.upScore = true -- On a bien scoré 
      score.compteur.nb = score.compteur.nb + score.compteur.brick
    else
      score.compteur.upScore = false
    end
  end
   
  -- == COLLISION MAP == --
  -- la balle rencontre le mur
  -- De droite 
  if ball.x > largeur then 
    ball.x = largeur -- la balle ne peut pas dépasser la largeur. ceci pour eviter les bugs si la balle va vite
    ball.vx = 0 - ball.vx --(privilegier le calcul a une valeur brute pour changer la vitesse a chaque fois)
  -- De gauche
  elseif ball.x < 0 then 
    ball.x = 0
    ball.vx = 0 - ball.vx
  end
  
  -- la balle rencontre le plafond
  if ball.y <= ui.height then
    ball.y = ui.height + ball.rayon
    ball.vy = 0 - ball.vy
  end
  
  -- On perd une balle
  if ball.y >= line.y then
    ball.sticked = true
    vie.nb = vie.nb - 1
  end
  
  -- la balle rebondit sur la raquette
  local posCollisionPad = pad.y - (pad.hauteur / 2) - ball.rayon
  
  if ball.y > posCollisionPad then
    local dist = math.abs(pad.x - ball.x)
    
    if dist < pad.largeur / 2 then
      ball.vy = 0 - ball.vy
      ball.y = posCollisionPad
    end
  end
  
  -- Fin action balle
  
end

function love.draw() -- S'occupe d'afficher à l'écran
  
  -- Dessiner le fond de l'ui
    love.graphics.draw(ui.img,1, 1)
  
  -- Dessiner la map 
  local l, c
  local bx, by = 0, 0 --bx, by = position de la brique en x et en y
    
  for l = 1,8 do
    bx = 0 -- Chaque ligne commence au bord de l'écran donc x = 0  

    for c = 1, 15 do
      if lvl[l][c] == 1 then -- Si dans le lvl, la valeur dans ligne == 1 et colonne == 1
        love.graphics.rectangle("fill", bx + 1, by + 1 , brick.largeur - 2, brick.hauteur - 2) -- alors on dessine un rectangle
      else
        lvl[l][c] = 0
      
      end
      bx = bx + brick.largeur -- Chaque colonne commence apres la largeur de la brique précédente
    end
    
    by = by + brick.hauteur -- chaque ligne commence apres la hauteur de la brique précédente
  end
  
  --Dessier une raquette 
   love.graphics.draw(pad.img, pad.x - (pad.largeur/2), pad.y - (pad.hauteur/2))--, 0, 0, 0, pad.largeur/2, 1)
    
  -- Si je dessine un rectangle  
  --love.graphics.rectangle("fill", pad.x - (pad.largeur / 2), pad.y - (pad.hauteur / 2 ), pad.largeur, pad.hauteur)--("fill"= rectangle plein, posx, posy, largeur,hauteur)
  
  --Dessiner une balle
  love.graphics.draw(ball.img, ball.x, ball.y, 0, 1, 1, ball.size - ball.rayon, ball.size - ball.rayon)
  -- Si je dessine un cercle
  --love.graphics.circle("fill", ball.x, ball.y, ball.rayon) --pleine, posx, posy, rayon
  
  --Dessiner une ligne game over (rectangle de 1 de hauteur)
  love.graphics.rectangle("fill", line.x, line.y, line.width, line.height)
  
  --Afficher le score
  love.graphics.print("Score : "..score.compteur.nb, score.x , score.y)
    
  -- Afficher la vie
  -- On a 3 vies
  if vie.nb == 3 then
    love.graphics.draw(vie.img.troisVie, vie.x, vie.y)
  
  elseif vie.nb == 2 then
    love.graphics.draw(vie.img.deuxVie, vie.x, vie.y)

  elseif vie.nb == 1 then
    love.graphics.draw(vie.img.uneVie, vie.x, vie.y)

  else 
    love.graphics.draw(vie.img.noVie, vie.x, vie.y)
    love.graphics.print("You loose", largeur /3.1, hauteur /2, 0, 5, 5)
    love.graphics.print("Press r to restart", largeur - largeur/1.7, hauteur /1.6, 0 , 2, 2)
  end
  
end

function love.keypressed(key)
  
  if love.keyboard.isDown("r") and vie.nb == 0 then
    StartGame()
  end
  
  
    
  print(key)
  
end

function love.mousepressed(x, y, n)

  -- On décole la balle du pad
  if vie.nb >= 1 then
    if ball.sticked == true then
      ball.sticked =  false
      ball.vx = 200
      ball.vy = -200
    end
  end

end
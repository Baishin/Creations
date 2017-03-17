local hero = {}

hero.images = {}-- il y a 4 img du hero
hero.images[1] = love.graphics.newImage("img/player_1.png")
hero.images[2] = love.graphics.newImage("img/player_2.png")
hero.images[3] = love.graphics.newImage("img/player_3.png")
hero.images[4] = love.graphics.newImage("img/player_4.png")
hero.imgCurrent = 1 --on va le faire commencer par l'image 1

-- coordonnée du spawn
hero.line = 1
hero.column = 1

-- limiter la vitesse de deplacement, 1 appui = 1 case -- sinon le hero étant en delta time, il se déplace a 60 cases/s

hero.keyPressed = false

-- VIE DU PERSONNAGE

hero.life = 100
--hero.startStateDead = true
hero.dead = false
hero.dieImg = love.graphics.newImage("img/mini_die.png")


function StartGame() 
  hero.dead = false
  --hero.startStateDead = false
  hero.life = 100
  hero.line = 1
  hero.column = 1
  print("Game Started")
end

function hero.Update(pMap, dt)
  
--== DEBUT DU GAME ==--
  --if hero.startStateDead == true then
    --StartGame()
    --hero.startStateDead = false
  --end
  
  -- == TOUCHE RESTART == --
  
  if love.keyboard.isDown("r") and hero.dead == true then
    StartGame()
  end
  
  -- == FAIRE PASSER LES 4 IMAGES DU HERO POUR L'ANIMER --
    hero.imgCurrent = hero.imgCurrent + (5*dt)
  if math.floor(hero.imgCurrent) > #hero.images then
    hero.imgCurrent = 1
  end
    
  -- LES TOUCHES DE DEPLACEMENT --
  
  if love.keyboard.isDown("up", "z", "d", "right", "s", "down", "q", "left") then
    
     
    if hero.keyPressed == false then 
  
    -- pour verif de collision, je cree 2 variables dans lesquelles je stock la position avant deplacement
    
      local old_column = hero.column -- 2 variables pour enregistrer la position avant le deplacement
      local old_line = hero.line
    
  
    -- les touches de deplacement 
      if love.keyboard.isDown("z", "up") and hero.line > 1 and hero.dead == false then --2eme condition pour ne pas que le hero sorte de la map
        hero.line = hero.line - 1
      end
      
      
      if love.keyboard.isDown("d", "right") and hero.column < pMap.MAP_WIDTH and hero.dead == false then
        hero.column = hero.column + 1
      end
      
      
      if love.keyboard.isDown("s", "down") and hero.line < pMap.MAP_HEIGHT and hero.dead == false then
        hero.line = hero.line + 1
      end
      
      
      if love.keyboard.isDown("q", "left") and hero.column > 1 and hero.dead == false then
        hero.column = hero.column - 1
      end
      
          
      -- == VERIF DE COLLISION == --
      
      local id = pMap.Grid[hero.line][hero.column]
      if pMap.Collision(id) then
        
        print("Collision")
        hero.column = old_column --retour case d'avant
        hero.line = old_line
      end
      
      -- Fin verif de collision
      
      -- == LES DMG LIES A L'ENVIRONNEMENT == --
      
      if pMap.Dmg(id) then
        print ("BUUUUUUURN ! ")
        hero.life = hero.life - 15
      end
      
     
      hero.keyPressed = true
    end   
  else  
    hero.keyPressed = false
 end 
  
  
--==LE HERO MEUUUURT ==--
  if hero.life <= 0 then
     hero.life = 0
     hero.dead = true
  end
end


function Die()
  hero.life = 0
  print("Hero died")
end



function hero.Draw(pMap)
  
  -- AFFICHAGE DU HERO SUR LA MAP AVEC IMAGE 1 COMME POINT DE DEPART --
  local x = (hero.column - 1) * pMap.TILE_WIDTH
  local y = (hero.line - 1) * pMap.TILE_HEIGHT
  
  love.graphics.draw(hero.images[math.floor(hero.imgCurrent)], x, y, 0, 2, 2) --position x, y , rotation, scale x, scale y --le hero--

  -- VIE DU HERO
  local xPos = pMap.TILE_WIDTH - pMap.TILE_WIDTH
  local yPos = pMap.MAP_HEIGHT * pMap.TILE_HEIGHT  

  love.graphics.print("Vie : " ..hero.life, xPos, yPos)


  if hero.dead == true then
    love.graphics.draw(hero.dieImg, (pMap.MAP_WIDTH * pMap.TILE_WIDTH) / 2, (pMap.MAP_HEIGHT * pMap.TILE_HEIGHT) / 2, 0, 3.40, 4.35, hero.dieImg:getWidth()/2, hero.dieImg:getHeight()/2)
  end
 
 -- if hero.startStateDied == true then
 --  love.graphics.print(msg, (pMap.MAP_WIDTH * pMap.TILE_WIDTH) / 2 , (pMap.MAP_HEIGHT * pMap.TILE_HEIGHT) / 2)
 -- end
  
end




return hero

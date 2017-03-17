-- Afficher des traces dans la console pendant l'execution
io.stdout:setvbuf('no')

local lander = {} --module spatial
lander.x = 0 --position en x
lander.y = 0 --position en y
lander.speed = 3
lander.engineOn = false
lander.angle = 270 --par défaut, l'angle 0 est vers la droite
lander.vx = 0 --vitesse ou velocité
lander.vy = 0

lander.img = love.graphics.newImage("img/ship.png") --on stock l'image dans une variable

lander.imgEngine = love.graphics.newImage("img/engine.png")




function love.load()
  largeur = love.graphics.getWidth() -- on récupère la largeur de l'écran dans une variable pour la réutiliser
  hauteur = love.graphics.getHeight()
  
  lander.x = largeur/2 -- au milieu en x
  lander.y = hauteur/2 -- idem en y
end


function love.update(dt)
  -- Changer l'angle du vaisseau
  
  -- + 90° par sec à droite
  if love.keyboard.isDown("d") then
    lander.angle = lander.angle + (90 * dt) -- 90°/sec
    
      if lander.angle >= 360 then
        lander.angle = 0
      end
  end
  
  -- - 90° par sec à gauche
  if love.keyboard.isDown("q") then
    lander.angle = lander.angle - (90 * dt) 
    if lander.angle <= 0 then
      lander.angle = 360
    end
  end
  
  -- Boutton Z // avancer
  if love.keyboard.isDown("z") then
    
    lander.engineOn = true
    
    -- Avec un angle * une force (ou vitesse) on obtient la valeur de vx et vy en fonction de l'angle // cosinus = position x et sinus = position y // valeur entre 0 et 1
    local angleRadian = math.rad(lander.angle)
    local forceX = math.cos(angleRadian) * (lander.speed * dt)
    local forceY = math.sin(angleRadian) * (lander.speed * dt)
    lander.vx = lander.vx + forceX -- valeur de vx
    lander.vy = lander.vy + forceY -- valeur de vy
    
  else
      lander.engineOn = false
  end
  
  lander.vy = lander.vy + (0.6 * dt)
  
  if math.abs(lander.vx) > 1 then
    if lander.vx > 0 then
      lander.vx = 1
    else
      lander.vx = -1
    end
  end
  if math.abs(lander.vy) > 1 then
    if lander.vy > 0 then
      lander.vy = 1
     else
      lander.vy = -1
     end
  end
      
  -- on change la position en ajoutant une valeur qui se trouve etre la vitesse
  lander.x = lander.x + lander.vx -- vx vaut 0 donc pas de modif en x
  lander.y = lander.y + lander.vy --vy est soumit à la gravité
  
  

end

function love.draw()
-- On affiche le vaisseau, position x puis y, angle avec math.rad pour convertire en radius, scale x, scale y, position origine x et y)
  love.graphics.draw(lander.img, lander.x, lander.y, math.rad(lander.angle), 1, 1, lander.img:getWidth()/2, lander.img:getHeight()/2)
  
-- On affiche le moteur

  if lander.engineOn == true then -- uniquement si le moteur est allumé
    love.graphics.draw(lander.imgEngine, lander.x, lander.y, math.rad(lander.angle), 1, 1, lander.imgEngine:getWidth()/2, lander.imgEngine:getHeight()/2)
  end
  
  local sDebug = "sDebug : "
  sDebug = sDebug.."Angle = "..tostring(lander.angle) 
  sDebug = sDebug.." Vx : " ..tostring(lander.vx)
  sDebug = sDebug.." Vy : " ..tostring(lander.vy)
  love.graphics.print(sDebug, 0, 0)
  
  
  
end
-- Set Sounds

local sndJump = love.audio.newSource("sounds/sfx_movement_jump13.wav","static") --stream = pour les musiques : décodé au fur et a mesure --static = les sons sont préchargés donc lourds mais immédiats
local musicCool = love.audio.newSource("sounds/cool.mp3", "stream")
local sndLanding = love.audio.newSource("sounds/sfx_movement_jump13_landing.wav")



-- Sounds property --

-- sndJump
sndJump:setPitch(2)

-- musicCool
musicCool:setLooping(true)
musicCool:play()

-- sndLanding
sndLanding:setPitch(5)

-- musicLanding

function love.keypressed(key)
  if key == "up" then
    sndJump:play()
  end  
  if key == "down" then
    sndLanding:play()
  end  
  if key == "s" then
    musicCool:pause()
  end
  if key == "r" then
    musicCool:resume()
  end
end

-- Si la musique continue ou pas

local stopped = true

if musicCool:isStopped() then
    print("Musique stoppée")
else
  print("Musik online")
end





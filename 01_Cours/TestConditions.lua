vie = 1000

--attention aux subtilités !
--je peux utiliser elseif mais si une condition est réalisé et que l'on souhaite 
if vie == 100 then
  print("Vie Max !")
  
  else print("prout, t'es pas a 100 pile")
 
  if vie < 100 then
    print("vie < 100")
  elseif vie >100 then
    print("vie > 100")
  end
end
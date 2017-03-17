-- La fonction modifie la valeur de la table qu'elle n'a pas elle meme créé


hero = {}

hero.energy = 100

print("Energie du hero :", hero.energy)

function Hit (nbPoint)
  
  hero.energy = hero.energy - nbPoint
  
  return

end

Hit (5)
print("Energie du hero :", hero.energy)



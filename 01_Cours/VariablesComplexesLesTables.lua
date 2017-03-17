--Le but est de créer une variable complexe que l'on va mettre dans des "tables"
-- 1ere methode


hero = { vie = 5 , energie = 100 , nom = "Conan"}

print ( hero.vie)

-- Remarque : on peut mettre une table dans une table

  --hero = { vie = 5 , energie = 100 , nom = "Conan" , inventaire = { cases = 100 } }
  
  --print(hero.inventaire.slot)
  
  
  
-- 2eme methode

perso = { }

perso.life = 3
perso.energy = 100
perso.nom = "Conan"

perso.inventory = {} --2eme table a l'interieur de la premiere
perso.inventory.slot = 32



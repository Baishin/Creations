-- La fonctione ne modifie pas la valeur de la table qu'elle n'a pas créé

hero = {}

hero.energy = 100

boss = {}

boss.energy = 1000

function Hit (personnage,nombreDamage)
  
  personnage.energy = personnage.energy - nombreDamage
  
end

print("Hero life point :", hero.energy)

Hit (hero, 5)

print("Hero energy :", hero.energy)

print("Boss energy :", boss.energy)

Hit (boss, 45)

print ("Boss energy :", boss.energy) 
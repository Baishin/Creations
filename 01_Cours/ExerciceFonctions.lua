-- Le but est de créer une fonction qui va redonner la totalité de l'énergie du héro et du boss
-- Le héro aura 100 pts d'énergie, le boss 1000
-- Il faut réutiliser le code de la page MiseEnPratiqueFonction2


hero = {}

hero.energie = 100


boss = {}

boss.energie = 1000

print("Le hero a au depart", hero.energie, " PV")
print("Le boss a au depart", boss.energie, " PV")

-- creation d'une fonction qui va infliger des degats

function Hit (personnage, nbDegats)
  
  personnage.energie = personnage.energie - nbDegats
  
end

-- on appelle la fonction pour infliger des degats au hero
Hit (hero, 5)

print("Le hero a prit un coup et il lui reste ", hero.energie, " Pv")

-- on appelle la fonction pour infliger des degats au boss
Hit (boss, 45)
print("Le boss a prit un coup et il lui reste ", boss.energie, " Pv")



function Heal (personnage, healed)
  
  personnage.vie = healed
  
  
end

Heal (hero, 100)

print ("vie hero apres heal", hero.vie)


Heal (boss, 1000)

print ("vie boss apres heal", boss.vie)











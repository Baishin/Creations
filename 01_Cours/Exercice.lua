Hero = {}

Hero.Name = "Gandolf"
Hero.Class = "Mage"
Hero.LifePoint = 80
Hero.Mana = 114
Hero.Speed = 100
Hero.RegenManaPerSec = 0
Hero.CrouchSpeed = 50
Hero.SprintSpeed = 150
Hero.BaseDamage = 2
Hero.Level = 1


--Les Carac 


Hero.Attribute = {} -- En augmentant ses Levels il peut choisir les caractéristiques à améliorer


Hero.Attribute.Vitality = Hero.LifePoint + 5 
Hero.Attribute.Strength =  2
Hero.Attribute.Intel =  8
Hero.Attribute.Spirit = Hero.RegenManaPerSec + 6

Hero.Attribute.TotalAttk = Hero.Attribute.Strength + Hero.Attribute.Intel --ses point d'attaque total


--L'inventaire

Hero.Inventory = {}

Hero.Inventory.NumberPage = 5
Hero.Inventory.SlotPerPage = 16


-- L'équipement

Hero.Gear = {}

--Dans le principe de ce jeu la, il n'existe qu'un seul équipement qui se trouve sur les maps au fur et a mesure de l'avancement du jeu


Hero.Gear.Chest = 2 --equipé, avec une stat de 2
Hero.Gear.Hat = 0 --non équipé 
Hero.Gear.Legs = 2
Hero.Gear.Shoes = 0 --Oui, il commence pieds nus
Hero.Gear.RightHandedWeapon = 6 
Hero.Gear.LeftHandedWeapon = 0

Hero.Gear.Total = Hero.Gear.Chest + Hero.Gear.Hat + Hero.Gear.Legs + Hero.Gear.Shoes + Hero.Gear.RightHandedWeapon + Hero.Gear.LeftHandedWeapon



--Le calcul des dommages


Hero.Damage = {}

--Coup à la baguette

Hero.Damage.Wand = Hero.BaseDamage + Hero.Attribute.Strength + Hero.Attribute.Intel + Hero.Gear.Total 

--Premier skill

Hero.Damage.FireBall = Hero.BaseDamage + Hero.Attribute.TotalAttk + Hero.Gear.Total * 2

--Deuxieme skill

Hero.Damage.FlameThrower = Hero.BaseDamage + Hero.Attribute.TotalAttk + Hero.Gear.Total * 4


print("Mon perso à " ..Hero.Attribute.Vitality.. "PV et ".. Hero.Attribute.Spirit .."PM.")
print("Son coup de baguette inflige " ..Hero.Damage.Wand .." points de dégâts, sa boule de feu inflige " .. Hero.Damage.FireBall .." points de dégâts et son souffle de feu inflige " .. Hero.Damage.FlameThrower .." points de dégâts.")



--Fin







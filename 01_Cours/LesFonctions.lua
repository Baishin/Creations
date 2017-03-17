--Appeler une fonction

Hero = {}

Hero.Name = "Gandolf"
Hero.LP = 85
Hero.Mana = 100
Hero.Speed = 100

function StartGame()
    print("la fonction StartGame a été appelée")
    Hero.LP = 85
    Hero.Mana = 100
end

print("LP du héro :",Hero.LP)

StartGame ()

Hero.LP = Hero.LP - 1

print("LP du héro :",Hero.LP)

StartGame ()

print("LP du héro :",Hero.LP)

print("End")


--Réaliser un calcul

resultat = 50

function Addition(valeur1, valeur2)
  
  local resultat = valeur1 + valeur2 --local : la variable est locale a la fonction, on en a pas besoin a l'exterieur de la fonction (ne sera pas visible a l'ext)
  return resultat --return = renvoyer le resultat à l'appelant

end

-- nouveauResultat = Addition(5, 6) -- l'appelant est ici, c'est Addition(5,6) qui appelle la fonction. On stock la somme de l'addition dans la variable qui ici s'appelle nouveauResultat
print(resultat)





--ou alors 

-- nombreA = 5
-- nombreB = 6
-- Addition(nombreA, nombreB) si on veut additionner deux fonctions (chiffres)




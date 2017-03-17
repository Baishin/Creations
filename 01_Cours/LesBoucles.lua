-- Les boucles

-- La boucle FOR("pour") -- for variable = debut, fin, pas do ...end

for compteur = 1,10 do --Il est d'usage d'utiliser dans une boucle FOR une variable qui s'appelle i ou n
  
  print("Compteur à :")
  print(compteur)
  
end

for i = 1,10,2 do -- la 3eme valeur indique le nombre de pas entre chaque boucle
  
  print("i vaut")
  print(i)
  
end

--on peut décrémenter ~= incrémenter (juste avant)

for n = 100,50,-10 do
  
  print("n vaut")
  print(n)

end



-- La boucle WHILE ("tant que")

nombre = 10 -- ATTENTION ! Si le chiffre = 100 sans changement, la boucle est infinie et le code se bloque sur la boucle (bug)

while nombre > 100 do
  
  print("boucle en cours")
  print(chiffre)
  
end

-- Pour effectuer l'équivalent d'un for avec un while 

chiffre = 1

print("Chiffre vaut")
print(chiffre)

while chiffre <= 100 do
  
  chiffre = chiffre + 15
  
  print("Chiffre gagne 15." .." Chiffre est égal à")
  print(chiffre)

end

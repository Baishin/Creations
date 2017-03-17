-- Exercice boucle et condition

-- Executer une boucle 100 fois et affiche la variable uniquement quand la boucle est a mi chemin

-- Avec for

for i = 0,100,5 do
  
  if i == 50 then
    print("i est a mi parcours, il vaut "..i)
  end
  
end

print("Derniere valeur de i apres passage en boucle : ")
print(i) --i affiche nill

-- Avec while

n= 0

while n < 100 do
  
  n = n +5
  
  if n == 50 then
    print("n est a mi parcours, il vaut "..n)
  end

end

print("Derniere valeur de n apres passage en boucle : ".. n)



-- Executer des boucles de maniere a parcourir 40 colonnes et 10 lignes d'une grille imaginaire

colonne = 1
ligne = 1

print ("ZBOUUUUUUUUUUUUUUUUUB")

for colonne = 1,40 do
    for ligne = 1,10 do
      
      print("Je suis à la colonne " ..colonne .." et à la ligne " ..ligne)
      
      end
end



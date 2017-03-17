-- Les listes a 2 dimensions 

-- Ligne | 1 | 2 | -->
-- L1      A   B
-- L2      C   D

--  |
--  V


-- On créé une liste
-- On ajoute une liste à une liste
-- Recherche par double index : maListe [index1][index2]
-- On recréer le dessin en code :


ligne = {}

ligne[1] = {}
ligne[1][1] = "A" -- Premiere liste de la ligne 1
ligne[1][2] = "B" 

ligne[2] = {}
ligne[2][1] = "C"
ligne[2][2] = "D"

-- Double boucle pour parcourir la liste

for l = 1,#ligne do
  for c = 1,#ligne[l] do -- Se lit "nombre d'éléments de la ligne de l"
    
    print(ligne[l][c]) -- On affiche tous les éléments du tableau
    
  end
end


print("-------------")

for l = 1,#ligne do
  for c = 1,#ligne[l] do -- Se lit "nombre d'éléments de la ligne de l"
    
    print(l,c,ligne[l][c]) -- Ligne 1, colonne 1 = A etc
    
  end
end

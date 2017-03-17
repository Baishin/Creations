--Lua stocke la valeur des variables dans les tables comme dans un tableau

hero = {}

hero.x = 100

print(hero.x)
print(hero["x"]) --index du tableau == x

-- Une liste de couleur

couleurs = {}

couleurs[1] = "bleu"
couleurs[2] = "rouge"
table.insert(couleurs, "vert") -- j'ajoute la couleur verte dans le tableau mais je ne connais pas l'index (mais je peux le déduire, ici = 3)

-- Pour savoir combien j'ai d'index dans ma liste :
print(#couleurs)

--Quand on sait combien il y a d'éléments dans une liste on peut la parcourir avec une boucle for

for i = 1, #couleurs do
  print(couleurs[i])
end

print("----------------")

--Enlever un élément de la liste :


table.remove (couleurs, 2)

print(#couleurs)

for i = 1, #couleurs do
  print(couleurs[i])
end

-- On peut rajouter dans la liste des elements non indexés :

couleurs.nom = "Liste des couleurs" -- Le "for" ne récupère que des éléments numériques

print("----------------")

-- Une autre syntaxe pour parcourir les listes

for i, c in pairs (couleurs) do --pairs parcours tous les éléments de la liste sans distinction de l'index !! il affiche par ordre de déclaration des indexs de la liste !!
  
  print(c)
end

print("----------------")

for i, c in pairs (couleurs) do 
  print(i,c) -- Si j'indique l'indexe, on voit apparaitre les éléments numériques
end

print("----------------")

for i, c in ipairs (couleurs) do --ipairs n'affiche que les éléments numériques mais les remet dans l'ordre
  print(i,c) 
end

vie = 100

if vie == 100 then
  print("Vie Max !")
  
else print("Pas vie max")
end

--Pour enchainer les conditions on utilise elseif. 

if vie == 100 then
  print("Vie Max !")
  
elseif vie >= 50 then
  print("vie entre 50 et 100")
  
elseif vie >= 40 then
  print("Vie entre 40 et 50")
  
elseif vie > 100 then
  print("vie > 100")

elseif vie == 0 then
  print("T'es mort")
  
elseif vie > 0 then
  print("vie tres basse")
  
end

print ("Passons a la subtilité !")

--Attention ! Si on veut par ex qu'un message s'affiche a partir du moment ou la vie est différente de 100 et un autre message quand la vie est inférieur a 50 il faut intégrer un if...then...end dans la première condition. Ex en image : 

if vie == 100 then
  print("Vie Max !")
elseif vie ~= 100 then
  print("On est pas a 100 pile !")

  if vie == 50 then
    print("vie = 50")
  end  
  
-- Dans notre exemple il faut en fait vérifier deux conditions, pas une seule.
end

-- On peut mettre ca dans une fonction !

function CallLife ()
  print("Dans la fonction")
    if vie == 100 then
      print("Vie Max !")
    elseif vie ~= 100 then
      print("On est pas a 100 pile !")

      if vie == 50 then
        print("vie = 50")
      end  
      
    end
      print("Function ended")
end

CallLife()

print("Je passe la vie a 50")
vie = 50

CallLife ()
print ("End")

-- Les opérateurs de comparaison : 
-- == Egal ; ~= Différent ; <= Inférieur ou égal ; >= Supérieur ou égal ; < Inférieur ; > Supérieur

-- On peut plus simplement utiliser OR ou AND : or = ou bien , and = et

vie = 35

if vie >= 40 or vie <= 30 then
  print("Vie bof")
elseif vie >= 35 and vie <= 40 then
  print("vie toujours bof")
end



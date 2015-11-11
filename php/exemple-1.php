<?php
print("
 <HTML>
 <HEAD>
 <TITLE>Connexion</TITLE>
 </HEAD>

 <BODY>


 <HR>
 Bonjour en PHP ! <BR>
");

    $la_date=Date("d/m/Y à h:i s");

    $cr = "\n";
    print( $la_date );
		print("<HR>");
		print("date au moment de la requête : ");
		echo $_SERVER['REQUEST_TIME'];

print("


								 				 
 </HTML>
");
?>


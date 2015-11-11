<?php
 
  // première étape : désactiver le cache lors de la phase de test
ini_set("soap.wsdl_cache_enabled", "0");
 
// on indique au serveur à quel fichier de description il est lié
$serveurSOAP = new SoapServer('HelloYou.wsdl');
 
// ajouter la fonction getHello au serveur
$serveurSOAP->addFunction('getHello');
 
// lancer le serveur
if ($_SERVER['REQUEST_METHOD'] == 'POST')
 
  {
    $serveurSOAP->handle();
  }
else
  {
    echo 'désolé, je ne comprends pas les requêtes GET, veuillez seulement utiliser POST';
  }
 
function getHello($prenom, $nom)
{
  return 'Hello ' . $prenom . ' ' . $nom;
}
?>

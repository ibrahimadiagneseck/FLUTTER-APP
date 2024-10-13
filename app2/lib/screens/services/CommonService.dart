import 'package:cloud_firestore/cloud_firestore.dart';

// Déclaration de la classe CommonService, qui va interagir avec Firestore.
class CommonService {
  // Création d'une instance de FirebaseFirestore pour interagir avec la base de données Firestore.
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Méthode asynchrone pour récupérer les termes de confidentialité depuis Firestore.
  // Cette méthode renvoie une chaîne de caractères (String) contenant le contenu des termes.
  Future<String> get terms async {
    // Initialisation d'une variable vide pour stocker le contenu des termes.
    String content = '';

    // Référence au document 'terms' dans la collection 'commons' de Firestore.
    // Le document 'terms' contient probablement les termes de confidentialité ou d'autres informations similaires.
    DocumentReference documentReference = _firebaseFirestore.collection('commons').doc('terms');

    // Récupération du document correspondant à la référence et extraction du champ 'content'.
    // La méthode 'get()' renvoie un `DocumentSnapshot`, et on utilise 'get('content')' pour obtenir la valeur
    // du champ 'content' dans ce document. Cette valeur est assignée à la variable 'content'.
    content = (await documentReference.get()).get('content');

    // Remplacement des occurrences de '\\n' (backslashes littéraux suivis de "n", souvent utilisés pour
    // représenter des nouvelles lignes dans les bases de données ou fichiers) par de véritables sauts de ligne "\n".
    // Cela permet de restituer correctement le format du texte lorsqu'il est affiché.
    return content.replaceAll('\\n', "\n");
  }
}

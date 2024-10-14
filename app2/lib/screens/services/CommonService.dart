import 'package:cloud_firestore/cloud_firestore.dart';

// Déclaration de la classe CommonService pour interagir avec Firestore.
class CommonService {
  // Création d'une instance de FirebaseFirestore pour interagir avec la base de données Firestore.
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Méthode asynchrone pour récupérer les termes de confidentialité depuis Firestore.
  // Cette méthode renvoie une chaîne de caractères (String) contenant le contenu des termes.
  Future<String> get terms async {
    // Initialisation d'une variable vide pour stocker le contenu des termes.
    String content = '';

    // Référence au document 'terms' dans la collection 'commons' de Firestore.
    DocumentReference documentReference = _firebaseFirestore.collection('commons').doc('terms');

    try {
      // Récupération du document correspondant à la référence.
      DocumentSnapshot snapshot = await documentReference.get();

      // Vérification si le document existe dans Firestore.
      if (snapshot.exists) {
        // Extraction du champ 'content' du document Firestore et assignation à la variable 'content'.
        content = snapshot.get('content');
      } else {
        // Si le document n'existe pas, un message approprié est retourné.
        content = 'Le document des termes n\'existe pas dans Firestore.';
      }

    } catch (e) {
      // Gestion des erreurs pouvant survenir lors de la récupération du document.
      print('Erreur lors de la récupération des termes: $e');
      content = 'Une erreur est survenue lors de la récupération des termes.';
    }

    // Remplacement des occurrences de '\\n' (backslashes littéraux suivis de "n")
    // par des sauts de ligne réels "\n" avant de retourner le contenu.
    return content.replaceAll('\\n', "\n");
  }
}

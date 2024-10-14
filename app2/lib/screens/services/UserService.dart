
import 'package:app2/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum StateRegistration {
  COMPLETE,
  IN_PROGRESS,
}

class UserService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<UserModel> get user {
    return _auth.authStateChanges().asyncMap(
          (user) => UserModel(uid: user?.uid ?? '', email: user?.email ?? ''),
    );
  }

  Future<UserModel> auth(UserModel userModel) async {
    // UserCredential userCredential = await _auth.signInAnonymously();
    // print(userCredential.user);

    UserCredential userCredential;
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
    } catch (e) {
      userCredential = await _auth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );

      await mailinglist(
        userModel.email,
        stateRegistration: StateRegistration.COMPLETE,
      );
    }

    userModel.setUid = userCredential.user?.uid;

    return userModel;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }


  // La méthode 'mailinglist' est une méthode asynchrone qui gère l'enregistrement d'un utilisateur dans une collection Firestore
  // appelée 'mailinglist'. Elle accepte une adresse e-mail ainsi qu'un objet 'stateRegistration' représentant l'état de l'inscription.
  Future<StateRegistration> mailinglist(String email,
      { StateRegistration? stateRegistration } // Paramètre requis représentant l'état actuel de l'inscription
      ) async {

    // Définition de la collection Firestore dans laquelle les données seront stockées
    String collection = 'mailinglist';

    // Référence à un document Firestore spécifique basé sur l'adresse e-mail donnée
    DocumentReference documentReference = _firebaseFirestore.collection(collection).doc(email);

    // Récupération du document correspondant à cet e-mail dans Firestore
    DocumentSnapshot documentSnapshot = await documentReference.get();

    // Si un 'stateRegistration' est fourni, mettre à jour ou créer un nouveau document avec cet état
    if (stateRegistration != null) {

      // Enregistrement de l'état dans Firestore sous le champ 'state'
      await _firebaseFirestore.collection(collection).doc(email).set({
        'state': stateRegistration.toString(), // Conversion de l'énumération en chaîne de caractères
      });

      // Retourner l'état de l'inscription après la mise à jour
      return stateRegistration;
    }

    // Si le document existe déjà dans Firestore, récupérer l'état enregistré
    if (documentSnapshot.exists) {
      // Extraction de la valeur de l'état depuis Firestore
      String state = documentSnapshot.get('state');

      // Rechercher et retourner la valeur correspondante de l'énumération 'StateRegistration'
      return StateRegistration.values
          .firstWhere((element) => element.toString() == state);
    }

    // Si le document n'existe pas encore, créer un nouveau document avec l'état 'IN_PROGRESS'
    await documentReference.set({
      'state': StateRegistration.IN_PROGRESS.toString(),
    });

    // Retourner 'IN_PROGRESS' comme état par défaut si aucun état précédent n'existe
    return StateRegistration.IN_PROGRESS;
  }


}

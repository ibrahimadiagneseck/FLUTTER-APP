
import 'package:app2/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

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

      // await mailinglist(
      //   userModel.email,
      //   stateRegistration: StateRegistration.COMPLETE,
      // );
    }

    userModel.setUid = userCredential.user?.uid;

    return userModel;

  }
}

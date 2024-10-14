import 'package:app2/models/UserModel.dart';
import 'package:app2/screens/guest/Password.dart';
import 'package:app2/screens/guest/Term.dart';
import 'package:app2/screens/services/CommonService.dart';
import 'package:app2/screens/services/UserService.dart';
import 'package:flutter/material.dart';
import 'dashboard/Home.dart';
import 'guest/Auth.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  // Services pour récupérer les termes et gérer l'authentification
  CommonService _commonService = CommonService();
  UserService _userService = UserService();

  // Liste de widgets pour les différentes étapes du processus (connexion, termes, mot de passe)
  List<Widget> _widgets = [];
  // Index de l'écran actuellement sélectionné
  int _indexSelected = 0;

  // Stocke l'email de l'utilisateur lors de la connexion
  late String _email;

  @override
  void initState() {
    super.initState();

    // Écran d'authentification : gestion du passage d'étapes et stockage de l'email
    AuthScreen authScreen = AuthScreen(
      onChangedStep: (index, value) async {
        StateRegistration stateRegistration = await _userService.mailinglist(value);

        setState(() {
          _indexSelected = index!;
          _email = value;

          if (stateRegistration == StateRegistration.COMPLETE) {
            _indexSelected = _widgets.length - 1;
          }
        });
      },
    );

    // Écran de mot de passe : vérification de l'authentification avec l'email et le mot de passe
    PasswordScreen passwordScreen = PasswordScreen(
      onChangedStep: (index, value) async {
        UserModel connectedUserModel = await _userService.auth(
          UserModel(
            email: _email,
            password: value!,
          ),
        );

        setState(() {
          if (index != null) {
            _indexSelected = index;
          }

          if (connectedUserModel != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          }
        });
      },
    );

    // Récupération des termes via CommonService puis ajout des écrans à la liste des widgets
    _commonService.terms.then(
          (terms) => setState(
            () => _widgets.addAll([
          authScreen, // Écran d'authentification
          TermScreen(
            terms: terms,
            onChangedStep: (index) => setState(() => _indexSelected = index!), // Passage à l'étape suivante
          ),
          passwordScreen, // Écran de mot de passe
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Si la liste des widgets est vide, afficher un écran de chargement
    return Container(
      child: _widgets.isEmpty
          ? const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('Loading...'), // Texte de chargement pendant que les écrans sont récupérés
          ),
        ),
      )
          : _widgets.elementAt(_indexSelected), // Affiche l'écran sélectionné
    );
  }
}

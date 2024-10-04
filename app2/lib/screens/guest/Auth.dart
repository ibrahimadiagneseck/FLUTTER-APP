import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    // SafeArea : pour prendre toute la place de l'ecran
    return SafeArea(
        // Scaffold : pour avoir plusieur barre dont la barre des taches
        child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Everyone has \n'.toUpperCase(),
                      // TextStyle : par defaut le style va etre aussi appliqué aux enfants
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30
                      ),
                      children: [
                        TextSpan(
                            text: 'knowlegde\n'.toUpperCase(),
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        TextSpan(
                            text: 'to share\n'.toUpperCase()
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  const Text('It all starts here.', style: TextStyle(fontStyle: FontStyle.italic),),
                  // SizedBox : pour avoir de l'espace
                  const SizedBox(
                    height: 50.0,
                  ),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch, // stretch : toute la place disponible
                      children: [
                        const Text('Enter your email'),
                        const SizedBox(height: 10.0,),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Ex: john.doe@domain.tld',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                borderSide: BorderSide(color: Colors.grey),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () {
                          // action
                        },
                        child: Text(
                          'Continue'.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                    )
                  ),
                ],
              ),
            )
          )
        )
    );
  }
}

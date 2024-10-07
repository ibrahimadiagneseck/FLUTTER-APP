import 'package:flutter/material.dart';

class TermScreen extends StatefulWidget {
  // const TermScreen({super.key});

  final Function(int?, String) onChangedStep;


  const TermScreen({
    super.key,
    required this.onChangedStep,
  });

  @override
  State<TermScreen> createState() => _TermScreenState();
}

class _TermScreenState extends State<TermScreen> {
  late ScrollController _scrollController;
  bool _termsReaded = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Ajout d'un écouteur d'événements pour le ScrollController
    _scrollController.addListener(() {
      // Vérifie si l'utilisateur a défilé jusqu'à la fin du contenu
      if (_scrollController.offset >= // La position de défilement actuelle
          _scrollController.position.maxScrollExtent && // La position maximale que l'utilisateur peut atteindre (fin du scroll)
          !_scrollController.position.outOfRange) { // Vérifie que la position n'est pas en dehors des limites (ne dépasse pas la fin)
        // Si l'utilisateur a atteint la fin du défilement, mettre à jour l'état pour indiquer que les termes ont été lus
        setState(() => _termsReaded = true); // Change la variable d'état `_termsReaded` à `true`, ce qui pourrait activer un bouton ou une autre action
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              titleSpacing: 0.0,
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text('Terms & Conditions', style: TextStyle(color: Colors.black)),
              leading: IconButton(
                onPressed: () => widget.onChangedStep(0, ''),
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      // child: Column(
                      //   crossAxisAlignment: CrossAxisAlignment.stretch,
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Text(widget.terms),
                      //   ],
                      // ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton( // Remplacez RaisedButton par ElevatedButton
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      backgroundColor: Theme.of(context).primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                    onPressed: !_termsReaded ? null : () => widget.onChangedStep(2, ''),
                    child: Text(
                      'accept & continue'.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

        )
    );
  }
}

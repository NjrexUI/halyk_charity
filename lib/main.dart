import 'package:blagotvoritelnyi_kal/screens/anketa_details_screen.dart';
import 'package:provider/provider.dart';

import './providers/ankets.dart';
import './providers/auth.dart';
import './screens/ankety_screen.dart';
import './screens/add_anketa_screen.dart';
import './screens/login_screen.dart';
import './screens/start_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: Ankets(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Blagotvoritelnost',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: StartScreen(),
          routes: {
            AuthScreen.routeName: (ctx) => AuthScreen(),
            AddAnketsScreen.routeName: (ctx) => AddAnketsScreen(),
            AnketyScreen.routeName: (ctx) => AnketyScreen(),
            AnketaDetails.routeName: (ctx) => AnketaDetails(),
          },
        ),
      ),
    );
  }
}

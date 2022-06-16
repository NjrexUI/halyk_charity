import 'package:blagotvoritelnyi_kal/providers/ankets.dart';
import 'package:blagotvoritelnyi_kal/screens/add_anketa_screen.dart';
import 'package:blagotvoritelnyi_kal/screens/anketa_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnketyScreen extends StatelessWidget {
  static const routeName = "/ankety-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ваши анкеты"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, AddAnketsScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<Ankets>(context, listen: false).fetchAndSetAnketa(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<Ankets>(
                child: Center(
                  child: const Text(
                      "Никаких анкет. Добавьте одну по кнопке сверху"),
                ),
                builder: (ctx, ankety, chi) => ankety.items.length <= 0
                    ? chi
                    : ListView.builder(
                        itemCount: ankety.items.length,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.green,
                          ),
                          title: Text(
                              "Анкета респондента - ${ankety.items[i].fio}"),
                          subtitle: Text("Заполнял - ${ankety.items[i].fio}"),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AnketaDetails.routeName,
                              arguments: ankety.items[i].id,
                            );
                          },
                        ),
                      ),
              ),
      ),
    );
  }
}

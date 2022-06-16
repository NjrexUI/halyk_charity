import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../helpers/db_helper.dart';

import '../providers/anketa.dart';

class Ankets with ChangeNotifier {
  List<Anketa> _items = [];

  List<Anketa> get items {
    return [..._items];
  }

  Anketa findById(String id) {
    return items.firstWhere(
      (anketa) => anketa.id == id,
    );
  }

  void addAnketa(
    BuildContext context,
    File pickedImage,
    String fio,
    String phone,
    String address,
    String age,
    String familyCondition,
    String littleChN,
    String who,
    String livingCondition,
    String job,
    String help,
    String why,
    String need,
    String yesNo,
    String fioVolunteer,
    String numberVolunteer,
  ) {
    const urlDb =
        "https://blagotovritelnost-default-rtdb.firebaseio.com/ankets.json";
    final newAnketa = Anketa(
      id: DateTime.now().toString(),
      image: pickedImage,
      fio: fio,
      phone: phone,
      address: address,
      age: age,
      familyCondition: familyCondition,
      littleChN: littleChN,
      who: who,
      livingCondition: livingCondition,
      job: job,
      help: help,
      why: why,
      need: need,
      yesNo: yesNo,
      fioVolunteer: fioVolunteer,
      numberVolunteer: numberVolunteer,
    );
    http.post(
      Uri.parse(urlDb),
      body: json.encode(
        {
          "id": newAnketa.id,
          "image": newAnketa.image.path,
          "fio": newAnketa.fio,
          "phone": newAnketa.phone,
          "address": newAnketa.address,
          "age": newAnketa.age,
          "familyCondition": newAnketa.familyCondition,
          "littleChN": newAnketa.littleChN,
          "who": newAnketa.who,
          "livingCondition": newAnketa.livingCondition,
          "job": newAnketa.job,
          "help": newAnketa.help,
          "why": newAnketa.why,
          "need": newAnketa.need,
          "yesNo": newAnketa.yesNo,
          "fioVolunteer": newAnketa.fioVolunteer,
          "numberVolunteer": newAnketa.numberVolunteer,
        },
      ),
    );
    if (newAnketa == null) {
      return;
    }
    _items.add(newAnketa);
    notifyListeners();
    DBHelper.insert(
      "user_ankets",
      {
        "id": newAnketa.id,
        "image": newAnketa.image.path,
        "fio": newAnketa.fio,
        "phone": newAnketa.phone,
        "address": newAnketa.address,
        "age": newAnketa.age,
        "familyCondition": newAnketa.familyCondition,
        "littleChN": newAnketa.littleChN,
        "who": newAnketa.who,
        "livingCondition": newAnketa.livingCondition,
        "job": newAnketa.job,
        "help": newAnketa.help,
        "why": newAnketa.why,
        "need": newAnketa.need,
        "yesNo": newAnketa.yesNo,
        "fioVolunteer": newAnketa.fioVolunteer,
        "numberVolunteer": newAnketa.numberVolunteer,
      },
    );
    Navigator.of(context).pop();
  }

  Future<void> fetchAndSetAnketa() async {
    final dataList = await DBHelper.getData("user_ankets");
    _items = dataList
        .map(
          (item) => Anketa(
            id: item["id"],
            image: File(
              item["image"],
            ),
            fio: item["fio"],
            phone: item["phone"],
            address: item["address"],
            age: item["age"],
            familyCondition: item["familyCondition"],
            littleChN: item["littleChN"],
            who: item["who"],
            livingCondition: item["livingCondition"],
            job: item["job"],
            help: item["help"],
            why: item["why"],
            need: item["need"],
            yesNo: item["yesNo"],
            fioVolunteer: item["fioVolunteer"],
            numberVolunteer: item["numberVolunteer"],
          ),
        )
        .toList();
    notifyListeners();
  }
}

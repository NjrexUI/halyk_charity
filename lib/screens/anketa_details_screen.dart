import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ankets.dart';

class AnketaDetails extends StatelessWidget {
  static const routeName = "/anketa-detail";
  showAlertDialog(BuildContext context) {
    // set up the button
    // ignore: deprecated_member_use
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop(this);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Все уже схвачено!"),
      content: Text("Данные о вашей анкете уже у нас."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final anketaId = ModalRoute.of(context).settings.arguments;
    final anketa =
        Provider.of<Ankets>(context, listen: false).findById(anketaId);
    final String fio = anketa.fio;
    final String phone = anketa.phone;
    final String address = anketa.address;
    final String age = anketa.age;
    final String familyCondition = anketa.familyCondition;
    final String littleChN = anketa.littleChN;
    final String who = anketa.who;
    final String livingCondition = anketa.livingCondition;
    final String job = anketa.job;
    final String help = anketa.help;
    final String why = anketa.why;
    final String need = anketa.need;
    final String yesNo = anketa.yesNo;
    final String fioVolunteer = anketa.fioVolunteer;
    final String numberVolunteer = anketa.numberVolunteer;
    final File image = anketa.image;

    bool _firstPress = true;

    return Scaffold(
      appBar: AppBar(
        title: Text("Ваша анкета"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Анкета для респондентов акции",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        "«Продуктовые наборы – 2021»",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Благотворительный фонд «Халык» проводит опрос с целью изучения уровня жизни уязвимых слоев населения и выработки мер, направленных на его повышение.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "1. ФИО респондента: $fio",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "2. Номер моб. телефона респондента: $phone",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "3. Полный адрес респондента: $address",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "4. Возраст респондента: $age",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "5. Семейное положение респондента: $familyCondition",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "6.1 Количество несовершеннолетних детей в семье респондента: $littleChN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "6.2 Есть ли у вас на содержании еще кто-то кроме ребенка/детей? Если да, укажите кто: $who",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "7. Ваши жилищные условия: $livingCondition",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "8. Укажите ваш основной вид занятости: $job",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "9. Какую помощь вы получаете: $help",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "10. Если вы не получаете помощь, укажите почему: $why",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "11. Какие острые нужды, проблемы есть у вашей семьи: $need",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "12. Готовы ли Вы пройти переобучение, чтобы освоить новую профессию: $yesNo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "ФИО заполнившего волонтера: $fioVolunteer",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Номер моб.телефона волонтера: $numberVolunteer",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CircleAvatar(
        radius: 35,
        backgroundColor: Theme.of(context).primaryColor,
        child: IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            if (_firstPress == true) {
              const urlDb =
                  "https://blagotovritelnost-default-rtdb.firebaseio.com/ankets.json";
              http.post(
                Uri.parse(urlDb),
                body: json.encode(
                  {
                    "id": anketa.id,
                    "image": anketa.image.path,
                    "fio": anketa.fio,
                    "phone": anketa.phone,
                    "address": anketa.address,
                    "age": anketa.age,
                    "familyCondition": anketa.familyCondition,
                    "littleChN": anketa.littleChN,
                    "who": anketa.who,
                    "livingCondition": anketa.livingCondition,
                    "job": anketa.job,
                    "help": anketa.help,
                    "why": anketa.why,
                    "need": anketa.need,
                    "yesNo": anketa.yesNo,
                    "fioVolunteer": anketa.fioVolunteer,
                    "numberVolunteer": anketa.numberVolunteer,
                  },
                ),
              );
              _firstPress = false;
            } else {
              showAlertDialog(context);
            }
          },
        ),
      ),
    );
  }
}

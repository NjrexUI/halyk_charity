import 'dart:io';

import 'package:flutter/foundation.dart';

class Anketa {
  final String id;
  final String fio;
  final String phone;
  final String address;
  final String age;
  final String familyCondition;
  final String littleChN;
  final String who;
  final String livingCondition;
  final String job;
  final String help;
  final String why;
  final String need;
  final String yesNo;
  final String fioVolunteer;
  final String numberVolunteer;
  final File image;

  Anketa({
    @required this.id,
    @required this.fio,
    @required this.phone,
    @required this.address,
    @required this.age,
    @required this.familyCondition,
    @required this.littleChN,
    @required this.who,
    @required this.livingCondition,
    @required this.job,
    @required this.help,
    @required this.why,
    @required this.need,
    @required this.yesNo,
    @required this.fioVolunteer,
    @required this.numberVolunteer,
    @required this.image,
  });
}

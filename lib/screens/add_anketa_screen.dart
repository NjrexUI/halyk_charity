import 'dart:io';

import 'package:blagotvoritelnyi_kal/providers/ankets.dart';
import 'package:blagotvoritelnyi_kal/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum familyCondition {
  married,
  notMarried,
  totallyNotMarried,
  without,
  unreigistred
}

_fCToString(familyCondition fc) {
  switch (fc) {
    case familyCondition.married:
      return "замужем/ женат";
    case familyCondition.notMarried:
      return "не замужем/ не женат";
    case familyCondition.totallyNotMarried:
      return "разведена/ разведен";
    case familyCondition.without:
      return "вдова/ вдовец";
    case familyCondition.unreigistred:
      return "состою в незарегистрированном браке";
  }
}

enum livingCondition { kvartita, house, room, houseForRent, uRodny }

_lCToString(livingCondition lc) {
  switch (lc) {
    case livingCondition.kvartita:
      return "квартира";
    case livingCondition.house:
      return "жилой дом";
    case livingCondition.room:
      return "комната";
    case livingCondition.houseForRent:
      return "съемное жилье";
    case livingCondition.uRodny:
      return "живем у родственников";
  }
}

enum whatDoYouDo {
  mercenary,
  soldier,
  businessmen,
  gosSluzh,
  noJob,
  noJobRegistr,
  student,
  pensia,
  farmer,
  otpusk
}

_whtDOToString(whatDoYouDo wd) {
  switch (wd) {
    case whatDoYouDo.mercenary:
      return "работающий по найму";
    case whatDoYouDo.soldier:
      return "военнослужащий в армии, органах внутренних дел";
    case whatDoYouDo.businessmen:
      return "предприниматель";
    case whatDoYouDo.gosSluzh:
      return "государственный служащий, работник административных органов";
    case whatDoYouDo.noJob:
      return "безработный зарегистрированный (состою на учете в службе занятости)";
    case whatDoYouDo.noJobRegistr:
      return "не работаю и не состою на учете в службе занятости";
    case whatDoYouDo.student:
      return "учащийся, студент";
    case whatDoYouDo.pensia:
      return "пенсионер";
    case whatDoYouDo.farmer:
      return "веду личное подсобное (фермерское) хозяйство";
    case whatDoYouDo.otpusk:
      return "нахожусь в отпуске по уходу за ребенком";
  }
}

enum whatHelp {
  help1,
  help2,
  help3,
  help4,
  help5,
  help6,
  help7,
  help8,
  help9,
  help10,
  help11,
}

_wHelpToString(whatHelp wh) {
  switch (wh) {
    case whatHelp.help1:
      return "адресная социальная помощь;";
    case whatHelp.help2:
      return "государственное социальное пособие по инвалидности;";
    case whatHelp.help3:
      return "специальное государственное пособие по инвалидности;";
    case whatHelp.help4:
      return "государственные социальные пособия по случаю потери кормильца;";
    case whatHelp.help5:
      return "государственная жилищная помощь на оплату коммунальных услуг;";
    case whatHelp.help6:
      return "государственная жилищная помощь на оплату расходов на содержание жилья;";
    case whatHelp.help7:
      return "государственная жилищная помощь на оплату арендной платы за пользование жильем;";
    case whatHelp.help8:
      return "государственное единовременное пособие в связи с рождением ребенка.";
    case whatHelp.help9:
      return "ежемесячное социальное пособие по уходу за ребенком по достижении им одного года.";
    case whatHelp.help10:
      return "социальные выплаты по утрате трудоспособности";
    case whatHelp.help11:
      return "социальные выплаты по потере работы";
  }
}

enum problems {
  problem1,
  problem2,
  problem3,
  problem4,
  problem5,
  problem6,
  problem7
}

_prToString(problems pr) {
  switch (pr) {
    case problems.problem1:
      return "приобретение продуктов питания";
    case problems.problem2:
      return "приобретение одежды для ребенка";
    case problems.problem3:
      return "оплата съемного жилья";
    case problems.problem4:
      return "оплата жилищно - коммунальных услуг";
    case problems.problem5:
      return "получение медицинской помощи, медицинских услуг, приобретение лекарств";
    case problems.problem6:
      return "на образование ребенка";
    case problems.problem7:
      return "какие еще острые нужды есть у вашей семьи";
  }
}

enum yesNo { yes, no }

_yesNoToString(yesNo yn) {
  switch (yn) {
    case yesNo.no:
      return "нет";
    case yesNo.yes:
      return "да";
  }
}

class AddAnketsScreen extends StatefulWidget {
  static const routeName = "/add-anketa";
  final form = GlobalKey<FormState>();

  void saveForm(
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
    final isValid = form.currentState.validate();
    if (!isValid) {
      return;
    }
    form.currentState.save();
    Provider.of<Ankets>(context, listen: false).addAnketa(
        context,
        pickedImage,
        fio,
        phone,
        address,
        age,
        familyCondition,
        littleChN,
        who,
        livingCondition,
        job,
        help,
        why,
        need,
        yesNo,
        fioVolunteer,
        numberVolunteer);
  }

  @override
  _AddAnketsScreenState createState() => _AddAnketsScreenState();
}

class _AddAnketsScreenState extends State<AddAnketsScreen> {
  familyCondition _familyCondition = familyCondition.married;
  livingCondition _livingCondition = livingCondition.kvartita;
  whatDoYouDo _whatDoUDO = whatDoYouDo.mercenary;
  whatHelp _whathelp = whatHelp.help1;
  problems _problems = problems.problem1;
  yesNo _yesno = yesNo.yes;

  String fio = "";
  String phone = "";
  String address = "";
  String age = "";
  String littleChN = "";
  String who = "";
  String why = "";
  String fioVolunteer = "";
  String numberVolunteer = "";
  File _pickedImage;

  void selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  Widget familyConditionButton(String title, familyCondition cnd) {
    return ListTile(
      title: Text(title),
      leading: Radio<familyCondition>(
        value: cnd,
        groupValue: _familyCondition,
        onChanged: (familyCondition value) {
          setState(() {
            _familyCondition = value;
          });
        },
      ),
    );
  }

  Widget livingConditionButtons(String title, livingCondition cnd) {
    return ListTile(
      title: Text(title),
      leading: Radio<livingCondition>(
        value: cnd,
        groupValue: _livingCondition,
        onChanged: (livingCondition value) {
          setState(() {
            _livingCondition = value;
          });
        },
      ),
    );
  }

  Widget whatToDoBtn(String title, whatDoYouDo wdt) {
    return ListTile(
      title: Text(title),
      leading: Radio<whatDoYouDo>(
        value: wdt,
        groupValue: _whatDoUDO,
        onChanged: (whatDoYouDo value) {
          setState(() {
            _whatDoUDO = value;
          });
        },
      ),
    );
  }

  Widget helpRadioButton(String title, whatHelp wh) {
    return ListTile(
      title: Text(title),
      leading: Radio<whatHelp>(
        value: wh,
        groupValue: _whathelp,
        onChanged: (whatHelp value) {
          setState(() {
            _whathelp = value;
          });
        },
      ),
    );
  }

  Widget radioAndTextButton(String title, problems pr) {
    return ListTile(
      title: Text(title),
      leading: Radio<problems>(
        value: pr,
        groupValue: _problems,
        onChanged: (problems value) {
          setState(() {
            _problems = value;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Добавьте новую анкету"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Благотворительный фонд «Халык» проводит опрос с целью изучения уровня жизни уязвимых слоев населения и выработки мер, направленных на его повышение.",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 3, color: Colors.black),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Form(
                onChanged: () {
                  Form.of(primaryFocus.context).save();
                },
                key: widget.form,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: "1. ФИО респондента"),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        fio = value;
                      },
                    ),
                    Text("(заполняется волонтером согласно списку)"),
                    SizedBox(height: 15),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "2. Номер моб. телефона респондента"),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      onSaved: (value) {
                        phone = value;
                      },
                    ),
                    Text("(заполняется волонтером согласно списку)"),
                    SizedBox(height: 15),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "3. Полный адрес респондента"),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      maxLines: 2,
                      onSaved: (value) {
                        address = value;
                      },
                    ),
                    Text("(заполняется волонтером согласно списку)"),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: "4. Возраст респондента"),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        age = value;
                      },
                    ),
                    Text("(заполняется волонтером согласно списку)"),
                    SizedBox(height: 15),
                    Text(
                        "5. Семейное положение респондента (заполняется волонтером со слов респондента)"),
                    Column(
                      children: <Widget>[
                        familyConditionButton(
                            _fCToString(familyCondition.married),
                            familyCondition.married),
                        familyConditionButton(
                            _fCToString(familyCondition.notMarried),
                            familyCondition.notMarried),
                        familyConditionButton(
                            _fCToString(familyCondition.totallyNotMarried),
                            familyCondition.totallyNotMarried),
                        familyConditionButton(
                            _fCToString(familyCondition.without),
                            familyCondition.without),
                        familyConditionButton(
                            _fCToString(familyCondition.unreigistred),
                            familyCondition.unreigistred),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText:
                            "6.1 Количество несовершеннолетних детей в семье респондента",
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        littleChN = value;
                      },
                    ),
                    Text("(заполняется волонтером согласно списку)"),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText:
                            "6.2 Есть ли у вас на содержании еще кто-то кроме ребенка/детей? Если да, укажите кто",
                      ),
                      textInputAction: TextInputAction.next,
                      maxLines: 3,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        who = value;
                      },
                    ),
                    Text("(заполняется волонтером согласно списку)"),
                    SizedBox(height: 15),
                    Text(
                        "7. Ваши жилищные условия? (заполняется волонтером со слов респондента)"),
                    Column(
                      children: <Widget>[
                        livingConditionButtons(
                            _lCToString(livingCondition.kvartita),
                            livingCondition.kvartita),
                        livingConditionButtons(
                            _lCToString(livingCondition.house),
                            livingCondition.house),
                        livingConditionButtons(
                            _lCToString(livingCondition.room),
                            livingCondition.room),
                        livingConditionButtons(
                            _lCToString(livingCondition.houseForRent),
                            livingCondition.houseForRent),
                        livingConditionButtons(
                            _lCToString(livingCondition.uRodny),
                            livingCondition.uRodny),
                      ],
                    ),
                    Text(
                        "8. Укажите ваш основной вид занятости? (заполняется волонтером со слов респондента)"),
                    Column(
                      children: <Widget>[
                        whatToDoBtn(_whtDOToString(whatDoYouDo.mercenary),
                            whatDoYouDo.mercenary),
                        whatToDoBtn(_whtDOToString(whatDoYouDo.soldier),
                            whatDoYouDo.soldier),
                        whatToDoBtn(_whtDOToString(whatDoYouDo.businessmen),
                            whatDoYouDo.businessmen),
                        whatToDoBtn(_whtDOToString(whatDoYouDo.gosSluzh),
                            whatDoYouDo.gosSluzh),
                        whatToDoBtn(_whtDOToString(whatDoYouDo.noJob),
                            whatDoYouDo.noJob),
                        whatToDoBtn(_whtDOToString(whatDoYouDo.noJobRegistr),
                            whatDoYouDo.noJobRegistr),
                        whatToDoBtn(_whtDOToString(whatDoYouDo.student),
                            whatDoYouDo.student),
                        whatToDoBtn(_whtDOToString(whatDoYouDo.pensia),
                            whatDoYouDo.pensia),
                        whatToDoBtn(_whtDOToString(whatDoYouDo.farmer),
                            whatDoYouDo.farmer),
                        whatToDoBtn(_whtDOToString(whatDoYouDo.otpusk),
                            whatDoYouDo.otpusk),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "9. Какую помощь вы получаете? (заполняется волонтером со слов респондента, ПРИ НЕОБХОДИМОСТИ ОТМЕТЬТЕ НЕСКОЛЬКО ПУНКТОВ)",
                        ),
                        helpRadioButton(
                            _wHelpToString(whatHelp.help1), whatHelp.help1),
                        helpRadioButton(
                            _wHelpToString(whatHelp.help2), whatHelp.help2),
                        helpRadioButton(
                            _wHelpToString(whatHelp.help3), whatHelp.help3),
                        helpRadioButton(
                            _wHelpToString(whatHelp.help4), whatHelp.help4),
                        helpRadioButton(
                            _wHelpToString(whatHelp.help5), whatHelp.help5),
                        helpRadioButton(
                            _wHelpToString(whatHelp.help6), whatHelp.help6),
                        helpRadioButton(
                            _wHelpToString(whatHelp.help7), whatHelp.help7),
                        helpRadioButton(
                            _wHelpToString(whatHelp.help8), whatHelp.help8),
                        helpRadioButton(
                            _wHelpToString(whatHelp.help9), whatHelp.help9),
                        helpRadioButton(
                            _wHelpToString(whatHelp.help10), whatHelp.help10),
                        helpRadioButton(
                            _wHelpToString(whatHelp.help11), whatHelp.help11),
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText:
                            "10. Если вы не получаете помощь, укажите почему",
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        why = value;
                      },
                    ),
                    Text("(заполняется волонтером со слов респондента)"),
                    SizedBox(height: 15),
                    Column(
                      children: [
                        Text(
                          "11. Какие острые нужды, проблемы есть у вашей семьи?(заполняется волонтером со слов респондента: СПРОСИТЬ И ЗАПОЛНИТЬ КАЖДЫЙ ПУНКТ ОТДЕЛЬНО, ОТМЕТИТЬ 3 НАИБОЛЕЕ ОСТРЫХ ПРОБЛЕМЫ)",
                        ),
                        radioAndTextButton(
                            _prToString(problems.problem1), problems.problem1),
                        radioAndTextButton(
                            _prToString(problems.problem2), problems.problem2),
                        radioAndTextButton(
                            _prToString(problems.problem3), problems.problem3),
                        radioAndTextButton(
                            _prToString(problems.problem4), problems.problem4),
                        radioAndTextButton(
                            _prToString(problems.problem5), problems.problem5),
                        radioAndTextButton(
                            _prToString(problems.problem6), problems.problem6),
                        radioAndTextButton(
                            _prToString(problems.problem7), problems.problem7),
                      ],
                    ),
                    SizedBox(height: 15),
                    Column(
                      children: [
                        Text(
                            "12. Готовы ли Вы пройти переобучение, чтобы освоить новую профессию?"),
                        ListTile(
                          title: Text(_yesNoToString(yesNo.no)),
                          leading: Radio<yesNo>(
                            value: yesNo.no,
                            groupValue: _yesno,
                            onChanged: (yesNo value) {
                              setState(() {
                                _yesno = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(_yesNoToString(yesNo.yes)),
                          leading: Radio<yesNo>(
                            value: yesNo.yes,
                            groupValue: _yesno,
                            onChanged: (yesNo value) {
                              setState(() {
                                _yesno = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "ФИО заполнившего волонтера"),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        fioVolunteer = value;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Номер моб.телефона волонтера"),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      onSaved: (value) {
                        numberVolunteer = value;
                      },
                    ),
                    SizedBox(height: 15),
                    ImagePicker(selectImage),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CircleAvatar(
        radius: 30,
        child: IconButton(
          icon: Icon(
            Icons.save,
            size: 30,
          ),
          onPressed: () {
            widget.saveForm(
              context,
              _pickedImage,
              fio,
              phone,
              address,
              age,
              _fCToString(_familyCondition),
              littleChN,
              who,
              _lCToString(_livingCondition),
              _whtDOToString(_whatDoUDO),
              _wHelpToString(_whathelp),
              why,
              _prToString(_problems),
              _yesNoToString(_yesno),
              fioVolunteer,
              numberVolunteer,
            );
          },
        ),
      ),
    );
  }
}

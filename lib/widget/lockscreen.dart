import 'package:flutter/material.dart';
import 'package:flutter_sqlite_app/modelo/diary.dart';

class LockScreen extends StatefulWidget {
  List<Diary> diaries;
  LockScreen({required this.diaries, super.key});

  @override
  State<StatefulWidget> createState() => LockScreenState(diaries: diaries);

}

class LockScreenState extends State<LockScreen> {
  List<Diary> diaries;
  LockScreenState({required this.diaries});

  bool isNewDiary = false;
  Diary? dropDownValue = Diary();
  TextEditingController ctrlType = TextEditingController();
  TextEditingController ctrlCode = TextEditingController();

  @override
  void initState() {
    super.initState();
    isNewDiary =  diaries.isEmpty;
    if(!isNewDiary) {
      dropDownValue = diaries[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Visibility(
            visible: !isNewDiary,
            child: dropDownButton(),
          ),
          Visibility(
            visible: isNewDiary,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Tipo de diario',
              ),
              keyboardType: TextInputType.text,
              controller: ctrlType,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Código',
            ),
            keyboardType: TextInputType.text,
            obscureText: true,
            controller: ctrlCode,
          ),
          ElevatedButton(
            onPressed: isNewDiary ? save : unlock,
            child: Text(
              isNewDiary ? 'Guardar' : 'Desbloquear',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
  
  dropDownButton() {
    return DropdownButton<Diary>(
      onChanged: (value) => onChangedDiary(value),
      value: dropDownValue,
      icon: const Icon(Icons.arrow_drop_down),
      items: diaries!.map<DropdownMenuItem<Diary>>((Diary value) {
        return DropdownMenuItem<Diary>(
          value: value,
          child: Text(
            value.type,
          ),
        );
      }).toList(),
    );
  }

  save() {}

  unlock() {}

  onChangedDiary(Diary? diary) {
    setState(() {
      dropDownValue = diary;
    });
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_sqlite_app/modelo/diary.dart';
import 'package:flutter_sqlite_app/modelo/page.dart';

typedef VoidCallBackParam = Function(DiaryPage? page);

class FormPage extends StatefulWidget {
  Diary? diary;
  DiaryPage? page;
  VoidCallBackParam voidCallBackParam;
  FormPage(this.voidCallBackParam, {this.diary, this.page, super.key});

  @override
  State<StatefulWidget> createState() => FormPageState(page: page);

}

class FormPageState extends State<FormPage> {
  DiaryPage? page;
  FormPageState({this.page});

  TextEditingController ctrlDate = TextEditingController();
  TextEditingController ctrlTitle = TextEditingController();
  TextEditingController ctrlContent = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(page != null) {
      ctrlDate.text = page!.date;
      ctrlTitle.text = page!.title;
      ctrlContent.text = page!.content;
    } else {
      ctrlDate.text = DateTime.now().toString().substring(0,11);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Fecha',
                ),
                keyboardType: TextInputType.text,
                controller: ctrlDate,
                enabled: false,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Título',
                ),
                keyboardType: TextInputType.text,
                controller: ctrlTitle,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Contenido',
                ),
                keyboardType: TextInputType.text,
                controller: ctrlContent,
              ),
              ElevatedButton(
                onPressed: save,
                child: Text(
                  'Guardar',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getTextBox() {
    page = (page != null) ? page : DiaryPage(diaryId: widget.diary!.id);
    page!.title = ctrlTitle.text;
    page!.content = ctrlContent.text;
    page!.date = ctrlDate.text;
  }

  save() async {
    getTextBox();
    await page?.saveOrUpdate();

    if(page != null) {
      widget.voidCallBackParam(page);
      Navigator.pop(context);
    }
  }

}
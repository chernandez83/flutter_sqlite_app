import 'package:flutter/material.dart';
import 'package:flutter_sqlite_app/modelo/page.dart';
import 'package:flutter_sqlite_app/pages/form_page.dart';
import 'package:path/path.dart';

class PageCard extends StatelessWidget {
  final DiaryPage page;
  VoidCallBackParam voidCallBackParam;
  PageCard(this.voidCallBackParam, {required this.page, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPageTap(context),
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              child: Icon(Icons.calendar_today),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    page.title,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Colors.orange.shade900,
                      ),
                      Text(
                        page.date,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  onPageTap(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormPage(voidCallBackParam, page: page),
      )
    );
  }

}
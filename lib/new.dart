import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';

class AccordionPage extends StatelessWidget //__
{
  build(context) => Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('Accordion'),
        ),
        body: Accordion(
          maxOpenSections: 4,
          headerBorderRadius: 20,
          headerBackgroundColor: Color(0xff999999),
          headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          children: [
            AccordionSection(
              isOpen: true,
              leftIcon: Icon(Icons.insights_rounded, color: Colors.white),
              header: Text(
                'Introduction',
              ),
              content: Text(""),
              contentHorizontalPadding: 20,
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: Icon(Icons.map, color: Colors.white),
              header: Text(
                'Map',
              ),
              content: Icon(Icons.map, size: 200, color: Color(0xff999999)),
            ),
          ],
        ),
      );
} //__
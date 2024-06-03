import 'package:autoscript/models/script_model.dart';
import 'package:autoscript/widgets/cardScript.dart';
import 'package:autoscript/widgets/containerCriate.dart';
import 'package:autoscript/widgets/containerMenu.dart';
import 'package:autoscript/widgets/filter.dart';
import 'package:autoscript/widgets/scrollBar.dart';
import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _MyWidgetState();
}

final ScrollController _scrollController = ScrollController();
Script scriptteste = Script(
    id: '1',
    name: 'teste',
    description: 'description',
    timetask: DateTime.now(),
    commands: ['teste1', 'teste2', 'teste3'],
    status: true,
    operationalSystem: 'W');

class _MyWidgetState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
        //  width: MediaQuery.of(context).size.width / 100 * 90,
           height: MediaQuery.of(context).size.height / 100 * 90,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 100 * 70,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FilterWidget(),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: ScrollBarWidgetState(),
                      ),
                    ),
                  ],
                ),
              ),
             CriateContainerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final String id;

  const TestPage(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: TextButton(
          onPressed: () {
            showDialog(context);
          },
          child: Text("TEXT BUTTON"),
        ),
      ),
    );
  }

  void showDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (
        BuildContext buildContext,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return SafeArea(
          child: Builder(builder: (context) {
            return Material(
              color: Colors.transparent,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 200.0,
                  width: 250.0,
                  color: Colors.white,
                  child: Center(child: Text('Testing')),
                ),
              ),
            );
          }),
        );
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      // 지정안하면 디폴트값 투명
      //barrierColor: Colors.red,
      transitionDuration: const Duration(milliseconds: 150),
    );
  }
}

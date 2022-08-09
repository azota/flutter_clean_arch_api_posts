import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../router/router.dart';

class TestPage extends StatelessWidget {
  final String id;

  const TestPage(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${id}');
  }
}

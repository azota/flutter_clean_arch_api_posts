import 'package:flutter/material.dart';

class ItemCommentWidget extends StatelessWidget {
  final String name;
  final String email;
  final String body;

  const ItemCommentWidget(this.name, this.email, this.body, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const Icon(
              Icons.comment_sharp,
              color: Colors.blue,
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name:',
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                  Text(name),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Emai:',
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                  Text(email),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Body:',
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                  Text(body),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

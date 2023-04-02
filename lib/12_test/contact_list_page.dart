import 'package:flutter/material.dart';

class ContactListPage extends StatefulWidget {
  final List<String> _names;

  const ContactListPage({Key? key, required List<String> names})
      : _names = names,
        super(key: key);

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  @override
  Widget build(BuildContext context) {
    final names = widget._names;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(names[index]),
          );
        },
        itemExtent: 50,
        itemCount: names.length,
      ),
    );
  }
}

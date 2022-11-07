import 'package:flutter/material.dart';

class InstagramProfileModalBottomSheet extends StatelessWidget {
  const InstagramProfileModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.only(top: 16.0),
            children: [
              ListTile(
                contentPadding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                leading: const CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 30,
                ),
                title: const Text(
                  'nfabroc_',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Radio<bool>(
                  value: true,
                  groupValue: true,
                  onChanged: (value) {},
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 30,
                  child: Icon(Icons.add),
                ),
                title: Text(
                  'Añadir cuenta',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Positioned.fill(
            top: 16,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 40,
                height: 4,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

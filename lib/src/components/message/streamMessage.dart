import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StringMessage extends StatelessWidget {
  const StringMessage(
    this.streMessage, {
    super.key,
  });
  final Stream<QuerySnapshot<Map<String, dynamic>>> streMessage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: StreamBuilder(
          stream: streMessage,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final messeage = snapshot.data.docs as Iterable;
              final widgets = messeage
                  .map((e) => Text(
                        e.data()['sms'],
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ))
                  .toList();
              return ListView(
                children: widgets,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

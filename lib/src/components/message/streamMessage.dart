import 'package:chat_app/src/data/messageModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              final messeage = (snapshot.data.docs.reversed as Iterable).map(
                (e) => Message.fromJson(e.data())
                  ..isMy = e.data()['sender'] ==
                      FirebaseAuth.instance.currentUser?.email,
              );

              return ListView(
                children: messeage.map((e) => MessageWidjed(e)).toList(),
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

class MessageWidjed extends StatelessWidget {
  const MessageWidjed(this.message, {super.key});
  final Message message;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        !message.isMy! ? 10 : width / 4,
        7,
        message.isMy! ? 10 : width / 4,
        7,
      ),
      child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(25),
              bottomRight: const Radius.circular(25),
              topLeft: message.isMy!
                  ? const Radius.circular(25)
                  : const Radius.circular(0),
              topRight: !message.isMy!
                  ? const Radius.circular(25)
                  : const Radius.circular(0),
            ),
          ),
          elevation: 8.0,
          shadowColor: Colors.black,
          color: message.isMy! ? theme.primary : theme.onPrimaryContainer,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                !message.isMy!
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            message.sender,
                            style: TextStyle(
                              color: theme.primary,
                            ),
                          )
                        ],
                      )
                    : const SizedBox(),
                Text(
                  message.sms,
                  style: TextStyle(
                    fontSize: 20,
                    height: 1.4,
                    color: message.isMy! ? Colors.white : null,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      DateFormat('dd.MM.yy hh:mm').format(message.dateTime),
                      style: TextStyle(
                        fontSize: 14,
                        color: message.isMy! ? Colors.white : null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';

class SendMessage extends StatelessWidget {
  const SendMessage(this.textController, {super.key, this.onPressed});
  final TextEditingController textController;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
        color: Colors.blue,
        width: 4,
      ))),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: 'Type your message',
              ),
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}

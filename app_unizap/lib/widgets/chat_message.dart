import 'package:app_unizap/utils/constants.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
    this.data,
    this.self, {
    Key? key,
  }) : super(key: key);

  final Map<String, dynamic> data;
  final bool self;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: self ? Constants.kGreen : Constants.kBlue,
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          !self
              ? Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(data['photoUrl'])))
              : Container(),
          Expanded(
              child: Column(
            crossAxisAlignment:
                self ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(data['displayName'],
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500)),
              data['imgUrl'] != null
                  ? Image.network(data['imgUrl'], width: 180)
                  : Text(
                      data['mensagem'],
                      textAlign: self ? TextAlign.end : TextAlign.start,
                      style: const TextStyle(fontSize: 20),
                    )
            ],
          )),
          self
              ? Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(data['photoUrl'])))
              : Container(),
        ],
      ),
    );
  }
}

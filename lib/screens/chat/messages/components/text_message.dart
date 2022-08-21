
import 'package:flutter/material.dart';
import 'package:wajah_id/model/colorPallete.dart';

import '../../../model/chat_model/chatMessage.dart';
import '../../chats/constant.dart';


class TextMessage extends StatelessWidget {
  const TextMessage({
    Key key,
    this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.75,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(color: kPrimaryColor.withOpacity(message.isSender ? 1 : 0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        message.text,
        style: TextStyle(
          color: message.isSender
              ? WajahColors.black
              : Theme.of(context).textTheme.bodyText1.color,
        ),
      ),
    );
  }
}
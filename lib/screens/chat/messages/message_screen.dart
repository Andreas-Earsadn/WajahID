
import 'package:flutter/material.dart';
import 'package:wajah_id/chat/messages/components/message_body.dart';
import 'package:wajah_id/model/colorPallete.dart';


import '../chats/constant.dart';


class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(color: WajahColors.black,),
          CircleAvatar(
            backgroundImage: AssetImage("assets/doctor_example.png"),
          ),
          SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "dr Andreas SP.Kk",
                style: TextStyle(fontSize: 16, color: WajahColors.black),
              ),
              Text(
                "Active 3m ago",
                style: TextStyle(fontSize: 12,color: WajahColors.grey),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.local_phone, color: WajahColors.WajahPrimary,),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.videocam, color: WajahColors.WajahPrimary),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
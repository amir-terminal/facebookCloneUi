import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';


class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  Rooms({this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: _CreateRoom(),
            );
          }
          return Container(
            padding: EdgeInsets.all(2.0),

              child: CircleAvatarImg(
                  imgUrl: onlineUsers[index - 1].imageUrl, size: 20.0 , isActive:true));
        },
      ),
    );
  }
}

class _CreateRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.white,
      textColor: Colors.blueAccent,
      borderSide: BorderSide(width: 2.0, color: Colors.blueAccent[100]),
      child: Row(
        children: [
          ShaderMask(
              shaderCallback: (rect) {
                return Palette.createRoomGradient.createShader(rect);
              },
              child: Icon(
                Icons.video_call,
                color: Colors.white,
                size: 30.0,
              )),
          SizedBox(
            width: 4.0,
          ),
          Text(
            'Create\nRoom',
          )
        ],
      ),
    );
  }
}

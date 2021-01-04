import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  CreatePostContainer({this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 0.0),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatarImg(imgUrl: currentUser.imageUrl, size: 30.0),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'What on your mind?',
                        hoverColor: Colors.grey)),
              )
            ],
          ),
          const Divider(
            color: Colors.grey,
            height: 15.0,
            thickness: 0.5,
          ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  onPressed: () => print('Live'),
                  icon: Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: Text('Record'),
                ),
                const VerticalDivider(
                  color: Colors.grey,
                  width: 8.0,
                  thickness: 0.5,
                ),
                FlatButton.icon(
                  onPressed: () => print('Photo'),
                  icon: Icon(
                    Icons.photo,
                    color: Colors.green,
                  ),
                  label: Text('Photo'),
                ),
                const VerticalDivider(
                  color: Colors.grey,
                  width: 8.0,
                  thickness: 0.5,
                ),
                FlatButton.icon(
                  onPressed: () => print('Photo'),
                  icon: Icon(
                    Icons.video_call,
                    color: Colors.purple,
                  ),
                  label: Text('Video'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PostContainer extends StatelessWidget {
  final Post post;

  PostContainer({this.post});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                Text(post.caption),
                post.imageUrl != null
                    ? SizedBox.shrink()
                    : SizedBox(
                        height: 8.0,
                      )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 3.0),
            child: post.imageUrl != null
                ? CachedNetworkImage(imageUrl: post.imageUrl)
                : SizedBox.shrink(),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: _PostStats(post: post))
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  _PostHeader({this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Row(
        children: [
          CircleAvatarImg(
            imgUrl: post.user.imageUrl,
            size: 20,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.user.name,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Text(
                      '${post.timeAgo} * ',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                          fontSize: 12.0),
                    ),
                    Icon(Icons.public, color: Colors.grey[600], size: 12.0)
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  _PostStats({this.post});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Palette.facebookBlue,
                ),
                child: Icon(Icons.thumb_up, size: 20.0, color: Colors.white),
              ),
              SizedBox(width: 6.0),
              Expanded(
                child: Text('${post.likes}',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey)),
              ),
              SizedBox(width: 6.0),
              Text('${post.comments} comments',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.grey)),
              SizedBox(width: 8.0),
              Text('${post.shares} shares',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.grey)),
            ],
          ),
          const Divider(
            height: 6.0,
          ),
          Row(
            
            children: [
              _PostButton(
                  lable: 'like',
                  icon: Icon(MdiIcons.thumbUpOutline,color: Colors.grey,),
                  onTap: () {}),
                  VerticalDivider(width: 6.0,thickness: 0.5,),
              _PostButton(
                  lable: 'comment',
                  icon: Icon(MdiIcons.commentOutline,color: Colors.grey,),
                  onTap: () {}),
                  VerticalDivider(width: 6.0),
              _PostButton(
                  lable: 'share',
                  icon: Icon(MdiIcons.shareAllOutline,color: Colors.grey),
                  onTap: () {}),
                  VerticalDivider(width: 6.0,),
            ],
          )
        ],
      ),
    );
  }
}

class _PostButton extends StatelessWidget {
  final String lable;
  final Icon icon;
  final Function onTap;

  _PostButton({this.lable, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              icon,
              const SizedBox(width: 6.0,),
              Text(lable,style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w600
              ),)
            ],),
          ),
        ),
      ),
    );
  }
}

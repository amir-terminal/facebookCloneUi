import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/server/data.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTapDown: (_) => FocusScope.of(context).unfocus(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              title: const Text(
                'facebook',
                style: TextStyle(
                    color: Palette.facebookBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                    letterSpacing: -1.2),
              ),
              floating: true,
              actions: [
                CircleButton(icon: Icons.search, size: 30.0, onPressed: () {}),
                CircleButton(
                  icon: MdiIcons.facebookMessenger,
                  size: 30.0,
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(color: Colors.blue),
                child: CreatePostContainer(currentUser: currentUser),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
              sliver: SliverToBoxAdapter(
                child: Rooms(onlineUsers: onlineUsers),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
              sliver: SliverToBoxAdapter(
                child: Stories(currentUser: currentUser, stories: stories),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            }, childCount: posts.length))
          ],
        ),
      ),
    );
  }
}

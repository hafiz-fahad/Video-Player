import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';

import 'package:netsign/data/global_data.dart';
import 'package:netsign/screens/menu_screen.dart';
import 'package:netsign/screens/video_player_screen.dart';

class HomeGallery extends StatefulWidget {
  HomeGallery({Key? key}) : super(key: key);

  @override
  _HomeGalleryState createState() => _HomeGalleryState();
}

class _HomeGalleryState extends State<HomeGallery> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              /// app logo
              Container(
                width: double.infinity,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: InkWell(
                      onTap: () {
                        Get.to(MenuScreen());
                      },
                      child: SvgPicture.asset(
                        'assets/netsign_logo_full_EN.svg',
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black))),
              ),

              /// heading
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
                child: Text(
                  'Gallery',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),

              /// content
              Expanded(
                  child: Container(
                color: Colors.black,
                child: GridView.count(
                    childAspectRatio: 1 / 1.2,
                    crossAxisCount: 3,
                    children: galleryItems
                        .map((e) => InkWell(
                              onTap: () {
                                Get.to(CelebrityVideoScreen());
                                // Get.to(MenuScreen());
                              },
                              child: Image.asset(
                                e,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ))
                        .toList()),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:velocity_x/velocity_x.dart';

class PhotoViewScreen extends StatelessWidget {
  const PhotoViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
                size: 24,
              ),
            ),
            SizedBox(
              height: 500,

              child: PhotoView(
                imageProvider:NetworkImage(Get.arguments.toString()),
              ),
            ).expand()
          ],
        ),
      ),
    );
  }
}

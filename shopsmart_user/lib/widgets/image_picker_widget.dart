import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatelessWidget {
  final XFile? pickedImage;
  final Function function;
  const PickImageWidget({super.key, this.pickedImage, required this.function});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: pickedImage == null
                ? Container(
                    decoration: BoxDecoration(
                        // color: Colors.grey.shade500,
                        border: Border.all(
                          color: Colors.grey
                        ),                    
                        borderRadius: BorderRadius.circular(18)),
                  )
                : Image.file(
                    File(pickedImage!.path),
                    fit: BoxFit.contain,
                  ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Material(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blueAccent,
            child: InkWell(
              onTap: () {
                function();
              },
              // splashColor: Colors.blue,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.camera_alt_rounded,
                  size: 25,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

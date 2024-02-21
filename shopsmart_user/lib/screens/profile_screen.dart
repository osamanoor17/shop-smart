import 'package:flutter/material.dart';
import 'package:shopsmart_user/widgets/title_text.dart';

import '../services/assets_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitlesTextWidget(label: 'Profile Screen'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.shoppingCart),
        ),
      ),
      body:  Column(
        children: [
          const Visibility(
            visible: false,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: TitlesTextWidget(label: "Please login to have unlimited access"),
            ),
          ),
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.background,
                  width: 3
                ),
                image: const DecorationImage(image: NetworkImage('https://p7.hiclipart.com/preview/722/101/213/computer-icons-user-profile-circle-abstract.jpg'))
                ),
              ),
            
            ],
          )
        ],
      ),
    );
  }
}

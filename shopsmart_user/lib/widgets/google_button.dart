import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(12),
          backgroundColor:
          Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )),
      icon: const Icon(Ionicons.logo_google,color: Colors.red,),
      label: const Text(
        "Signup with Google",
        style: TextStyle(fontSize: 12),
      ),
      onPressed: () async {

      },
    );
  }
}

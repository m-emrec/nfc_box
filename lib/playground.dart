// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nfc_box/core/utils/widgets/buttons/inline_text_button.dart';
import 'package:nfc_box/core/utils/widgets/custom_text_field.dart';
import 'package:nfc_box/logger.dart';

import 'core/utils/widgets/buttons/buttons_import.dart';

class PlayGround extends StatefulWidget {
  const PlayGround({super.key});

  @override
  State<PlayGround> createState() => _PlayGroundState();
}

class _PlayGroundState extends State<PlayGround> {
  final GlobalKey<FormState> a = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Form(
              key: a,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  // EmailField(
                  //   controller: TextEditingController(),
                  // ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                text: "asds ",
                children: [
                  InlineTextButton(
                    context,
                    text: "Click",
                    onTap: () => logger.i("Tapped"),
                  ),
                ],
              ),
            ),
            ResponsiveElevatedButton(
              onPressed: () async {},
              child: const Text("LAbel"),
            ),
            ResponsiveElevatedButton(
              isPrimary: false,
              onPressed: () async {
                FirebaseAuth.instance.signOut();
              },
              child: Text("LAbel"),
            ),
            GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                Box(color: Colors.green),
                Box(color: Colors.red),
                Box(color: Colors.cyan),
                Box(color: Colors.yellow),
                Box(color: Colors.pink),
              ],
            ),
            Row(
              children: [
                ResponsiveOutlinedButton(
                  onPressed: () async {},
                  child: const Text("data"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  final Color color;
  const Box({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

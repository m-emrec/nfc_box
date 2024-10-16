import 'package:flutter/material.dart';
import 'package:nfc_box/core/utils/widgets/custom_text_field.dart';
import 'package:nfc_box/core/utils/widgets/responsive_button.dart';
import 'package:nfc_box/logger.dart';

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
                  EmailField(
                    controller: TextEditingController(),
                  ),
                ],
              ),
            ),
            ResponsiveElevatedButton(
              onPressed: () {},
              child: const Text("LAbel"),
            ),
            ResponsiveElevatedButton(
              isPrimary: false,
              onPressed: () {
                a.currentState!.validate();
              },
              child: Text("LAbel"),
            ),
            Row(
              children: [
                ResponsiveOutlinedButton(
                  onPressed: () {},
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

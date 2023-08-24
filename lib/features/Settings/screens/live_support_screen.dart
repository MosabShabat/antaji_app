import 'package:antaji_app/constant/colors.dart';
import 'package:flutter/material.dart';

class LiveSupportScreen extends StatefulWidget {
  const LiveSupportScreen({super.key});

  @override
  State<LiveSupportScreen> createState() => _LiveSupportScreenState();
}

class _LiveSupportScreenState extends State<LiveSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.value,
      appBar: AppBar(),
    );
  }
}

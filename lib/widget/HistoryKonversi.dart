import 'package:flutter/material.dart';

// Alifia Shofa' Nabilah (2031710027)
class HistoryKonversi extends StatelessWidget {
  const HistoryKonversi({
    Key? key,
    required this.rw,
  }) : super(key: key);

  final List<String> rw;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: rw.length,
            itemBuilder: (context, index) {
              return Text(rw[index]);
            }));
  }
}

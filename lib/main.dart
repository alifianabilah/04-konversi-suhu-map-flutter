import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konversi_suhu2/widget/DaftarSuhu.dart';
import 'package:konversi_suhu2/widget/HistoryKonversi.dart';
import 'package:konversi_suhu2/widget/InputSuhu.dart';
import 'package:konversi_suhu2/widget/KonversiButton.dart';

void main() {
  runApp(MyApp());
}

// Alifia Shofa' Nabilah (2031710027)
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController text1 = TextEditingController();
  double kelvin = 0, reamor = 0, input = 0;
  double hasil = 0;

  String selctDropdown = "Reamur";
  List<String> listSuhu = ["Kelvin", "Reamur", "Fahrenheit"];
  List<String> Riwayat = [];

  void onDropChange(Object? value) {
    return setState(() {
      selctDropdown = value.toString();
      //Tugas Praktikum 1
      //  if (text1.text.isNotEmpty) {
      //   switch (selctDropdown) {
      //     case "Kelvin":
      //       hasil = int.parse(text1.text) + 273;

      //       break;

      //     case "Reamur":
      //       hasil = int.parse(text1.text) * 4 / 5;
      //       break;

      //     case "Fahrenheit":
      //       hasil = int.parse(text1.text) * 9 / 5 + 32;
      //       break;
      //     default:
      //   }
      //   Riwayat.add("konversi Dari " +
      //       text1.text +
      //       " Celcius Ke " +
      //       selctDropdown +
      //       " Dengan Hasil " +
      //       hasil.toString());
      //    }
      //    Riwayat.add("Kelvin : " + hasil.toString());
      // }
    });
  }

  //Tugas Praktikum 2
  void Konversi() {
    return setState(() {
      if (text1.text.isNotEmpty) {
        switch (selctDropdown) {
          case "Kelvin":
            hasil = int.parse(text1.text) + 273;

            break;

          case "Reamur":
            hasil = int.parse(text1.text) * 4 / 5;
            break;

          case "Fahrenheit":
            hasil = int.parse(text1.text) * 9 / 5 + 32;
            break;
          default:
        }
        Riwayat.add("konversi Dari " +
            text1.text +
            " Celcius Ke " +
            selctDropdown +
            " Dengan Hasil " +
            hasil.toString());
      }
      Riwayat.add("Kelvin : " + hasil.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Column(
            children: [
              Text('Konversi Suhu'),
              SizedBox(height: 10),
              Text('Alifia Shofa Nabilah (2031710027)'),
            ],
          )),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Column(
            children: [
              InputSuhu(text1: text1),
              DaftarSuhu(
                selctDropdown: selctDropdown,
                listSuhu: listSuhu,
                onDropChange: onDropChange,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Hasil',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              Text(
                "$hasil",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 30,
              ),
              KonversiButton(
                Kversi: Konversi,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "History Konversi ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              HistoryKonversi(rw: Riwayat)
            ],
          ),
        ),
      ),
    );
  }
}

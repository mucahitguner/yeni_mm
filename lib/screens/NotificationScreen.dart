import 'package:flutter/material.dart';
import 'package:muratmakasci/screens/FotoYil.dart';
import 'package:muratmakasci/screens/IlacHatirlatmasi.dart';
import 'package:muratmakasci/screens/ilkYikamaIkinciGun.dart';
import 'package:muratmakasci/screens/opgunu.dart';
import 'package:muratmakasci/screens/prpBirinciAy.dart';
import 'package:muratmakasci/service/notificationHelper.dart';
import 'package:muratmakasci/screens/FotoUcuncuGun.dart';
import 'KabukOnuncuGun.dart';

class Notificationscreen extends StatefulWidget {
  const Notificationscreen({super.key, this.payload});

  final String? payload;

  @override
  State<Notificationscreen> createState() => _NotificationscreenState();
}

class _NotificationscreenState extends State<Notificationscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        // MaterialApp gereksiz, kaldırılmalı
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: _buildBody(), // Ayrı bir fonksiyonda toplandı
        ),
      ),
    );
  }

  Widget _buildBody() {
    // Ayrı fonksiyon ile daha okunabilir

    try {
      if (widget.payload == "op_gunu" ||
          NotificationHelper.payload_bilgi == "op_gunu") {
        return Expanded(
          child: Opgunu(),
        );
      } else if (widget.payload == "yikama_video_ikinci_gun" ||
          NotificationHelper.payload_bilgi == "yikama_video_ikinci_gun") {
        return Expanded(
          child: ilkYikamaIkinciGun(),
        );
      } else if (widget.payload == "foto_sablon" ||
          NotificationHelper.payload_bilgi == "foto_sablon") {
        return Expanded(
          child: FotoUcuncuGun(),
        );
      } else if (widget.payload == "kabuk_onuncu_gun" ||
          NotificationHelper.payload_bilgi == "kabuk_onuncu_gun") {
        return Expanded(
          child: KabukOnuncuGun(),
        );
      } else if (widget.payload == "prp_birinci_ay" ||
          NotificationHelper.payload_bilgi == "prp_birinci_ay") {
        return Expanded(
          child: prpBirinciAy(),
        );
      } else if (widget.payload == "foto_yil" ||
          NotificationHelper.payload_bilgi == "foto_yil") {
        return Expanded(
          child: FotoYil(),
        );
      } else if (widget.payload == "ilac_onuncu_gun" ||
          NotificationHelper.payload_bilgi == "ilac_onuncu_gun") {
        return Expanded(
          child: Ilachatirlatmasi(),
        );
      } else {
        return const Center(
          // Varsayılan bir mesaj
          child: Text("Geçersiz bildirim içeriği"),
        );
      }
    } catch (e) {
      // Hata durumunda ne yapılacağını belirle
      print("Bildirim ekranında hata: $e"); // Logla
      print(NotificationHelper.payload_bilgi);
      return const Center(
        // Hata mesajı göster
        child: Text("Bildirim ekranında bir hata oluştu."),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:muratmakasci/model/musteri.dart';

class MusteriItem extends StatefulWidget {
  const MusteriItem({super.key, required this.mbilgi});

  final Musteri mbilgi;

  @override
  State<MusteriItem> createState() => _MusteriItemState();
}

class _MusteriItemState extends State<MusteriItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            widget.mbilgi.telefon!.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.mbilgi.adsoyad!.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.mbilgi.operasyon!.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.mbilgi.ulke!.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.mbilgi.dil!.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.mbilgi.danisman!.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.mbilgi.basvuru_tarihi!.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.mbilgi.operasyon_tarihi!.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.mbilgi.belgeler!.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.mbilgi.operasyon_tutari!.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.mbilgi.danisman_tel!.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

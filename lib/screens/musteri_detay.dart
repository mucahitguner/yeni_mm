import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:muratmakasci/home.dart';
import 'package:hexcolor/hexcolor.dart';
import '../service/DatabaseHelper.dart';
import '../service/musteri_service.dart';
import 'PDFScreen.dart';
import 'hakkimizda.dart';
import 'package:url_launcher/url_launcher.dart';

class MusteriDetay extends StatefulWidget {
  final String telefon;

  MusteriDetay({required this.telefon});

  @override
  State<MusteriDetay> createState() => _MusteriDetayState();
}

class _MusteriDetayState extends State<MusteriDetay> {
  final MusteriService musteriService = MusteriService();
  final DatabaseHelper databaseHelper = DatabaseHelper();

  String adsoyad = "";
  String operasyon = "";
  String ulke = "";
  String dil = "";
  String danisman = "";
  String basvuru_tarihi = "";
  String operasyon_tarihi = "";
  String belgeler = "";
  String operasyon_tutari = "";
  String danisman_tel = "";

  void musteriBilgileriEslestir() {
    musteriService.getMusteri(widget.telefon.trim()).then((value) {
      setState(() {
        adsoyad = value[0].adsoyad.toString();
        operasyon = value[0].operasyon.toString();
        ulke = value[0].ulke.toString();
        dil = value[0].dil.toString();
        danisman = value[0].danisman.toString();
        operasyon_tarihi = value[0].operasyon_tarihi.toString();
        basvuru_tarihi = value[0].basvuru_tarihi.toString();
        belgeler = value[0].belgeler.toString();
        operasyon_tutari = value[0].operasyon_tutari.toString();
        danisman_tel = value[0].danisman_tel.toString();
      });
    });
    //veritabanına numarayı ekle.
    databaseHelper.addData(widget.telefon.trim());
  }

  @override
  void initState() {
    // TODO: implement initState
    musteriBilgileriEslestir();
  }

  //
  @override
  Widget build(BuildContext context) {
    double ekranGenisligi = MediaQuery.of(context).size.width;
    double ekranYuksekligi = MediaQuery.of(context).size.height;
    final ButtonStyle kitapcik_btn_style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        backgroundColor: Colors.orange,
        padding: EdgeInsets.all(20));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Center(
              child: Text(
                "➔ Müşteri Bilgileri",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          drawer: Drawer(
              child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(bottom: 30, top: 20, left: 15),
                child: Image.asset("lib/assets/images/mm-yuvarlak-logo.png"),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Anasayfa"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Home(),
                  ));
                },
              ),
              ListTile(
                leading: Icon(Icons.account_box_outlined),
                title: Text("Hakkımızda"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Hakkimizda(),
                  ));
                },
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 20, left: 10),
                          child: Image.asset("lib/assets/images/ig-icon.png")),
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(top: 20, left: 10),
                            child: Text(
                              "muratmakasciclinic",
                              style: TextStyle(fontSize: 18),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 20, left: 10),
                          child: Image.asset("lib/assets/images/ig-icon.png")),
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(top: 20, left: 10),
                            child: Text(
                              "muratmakasciclinicaitalia",
                              style: TextStyle(fontSize: 18),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 20, left: 10),
                          child: Image.asset("lib/assets/images/fb-icon.png")),
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(top: 20, left: 10),
                            child: Text(
                              "muratmakasciklinikturkiye",
                              style: TextStyle(fontSize: 18),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 20, left: 10),
                          child: Image.asset(
                              "lib/assets/images/linkedin-icon.png")),
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(top: 20, left: 10),
                            child: Text(
                              "muratmakascıklinik",
                              style: TextStyle(fontSize: 18),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 20, left: 10),
                          child:
                              Image.asset("lib/assets/images/tiktok-icon.png")),
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(top: 20, left: 10),
                            child: Text(
                              "@muratmakasciklinik",
                              style: TextStyle(fontSize: 18),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 20, left: 10),
                          child: Image.asset(
                              "lib/assets/images/youtube-icon.png")),
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(top: 20, left: 10),
                            child: Text(
                              "@muratmakasciklinik",
                              style: TextStyle(fontSize: 18),
                            )),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 15, top: 40),
                    child: Text(
                      "+90 506 837 46 85",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 15, top: 20),
                    child: Text(
                      "www.muratmakasci.com",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          )),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 20),
              color: HexColor("#2b2b2b"),
              width: ekranGenisligi,
              height: ekranYuksekligi,
              child: Column(
                children: [
                  ClipOval(
                    child: Image.network(
                      "https://www.muratmakasci.com/crm/musteri-resimleri/" +
                          belgeler,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [Colors.orange, HexColor("#ff6c00")])),
                    child: Text(
                      adsoyad,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    child: Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.orange,
                      size: 40,
                    ),
                  ),
                  //ALT BİLGİLER
                  Container(
                    decoration: BoxDecoration(
                        color: HexColor("#f1f1f1"),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [Colors.white, HexColor("#cccccc")],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                    padding: EdgeInsets.all(20),
                    width: ekranGenisligi,
                    margin: EdgeInsets.only(left: 20, bottom: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Row(
                            children: [
                              Icon(Icons.phone, color: HexColor("#5876a0")),
                              Text(
                                "Telefon No: " + widget.telefon,
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Row(
                            children: [
                              Icon(Icons.health_and_safety_rounded,
                                  color: HexColor("#5876a0")),
                              Text("Operasyon: " + operasyon,
                                  style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month,
                                  color: HexColor("#5876a0")),
                              Text("Operasyon Tarihi: " + operasyon_tarihi,
                                  style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month,
                                  color: HexColor("#5876a0")),
                              Text("Başvuru Tarihi: " + basvuru_tarihi,
                                  style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Row(
                            children: [
                              Icon(Icons.monetization_on,
                                  color: HexColor("#5876a0")),
                              Text("Operasyon Tutarı: " + operasyon_tutari,
                                  style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Row(
                            children: [
                              Icon(Icons.flag, color: HexColor("#5876a0")),
                              Text("Ülke/Dil: " + ulke + " - " + dil,
                                  style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Row(
                            children: [
                              Icon(Icons.support_agent,
                                  color: HexColor("#5876a0")),
                              Text("Sağlık Danışmanı: " + danisman,
                                  style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.bottomCenter,
                    child: GradientElevatedButton.icon(
                      iconAlignment: IconAlignment.start,
                      onPressed: () async {
                        launchUrl(Uri.parse("tel:" + danisman_tel.trim()));
                      },
                      style: GradientElevatedButton.styleFrom(
                          shadowColor: Colors.blue,
                          iconSize: 55,
                          backgroundGradient: const LinearGradient(
                            colors: [
                              Color(0x0C5AA8FF),
                              Color(0x4AAAE6FF),
                            ],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                          ),
                          iconColor: Colors.white,
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(fontSize: 22)),
                      icon: Icon(Icons.support_agent),
                      label: Text("Sağlık Danışmanını Ara"),
                    ),
                  ),
                  Container(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          style: kitapcik_btn_style,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PDFScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "SAÇ EKİM SONRASI KİTAPÇIĞI",
                            style: TextStyle(color: Colors.white),
                          ))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*musteriService
    .getMusteri(numaraController.text.trim())
    .then((value) {
telefon = value[0].telefon.toString();
adsoyad = value[0].adsoyad.toString();
operasyon = value[0].operasyon.toString();
ulke = value[0].ulke.toString();
dil = value[0].dil.toString();
danisman = value[0].danisman.toString();
operasyon_tarihi =
value[0].operasyon_tarihi.toString();
basvuru_tarihi =
value[0].basvuru_tarihi.toString();
belgeler = value[0].belgeler.toString();
operasyon_tutari =
value[0].operasyon_tutari.toString();
});*/

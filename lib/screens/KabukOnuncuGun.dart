import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../home.dart';
import 'PDFScreen.dart';
import 'hakkimizda.dart';

class KabukOnuncuGun extends StatefulWidget {
  const KabukOnuncuGun({super.key});

  @override
  State<KabukOnuncuGun> createState() => _KabukOnuncuGunState();
}

class _KabukOnuncuGunState extends State<KabukOnuncuGun> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle kitapcik_btn_style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        backgroundColor: Colors.orange,
        padding: EdgeInsets.all(20));

    double ekranGenisligi = MediaQuery.of(context).size.width;
    double ekranYuksekligi = MediaQuery.of(context).size.height;

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
            backgroundColor: Colors.black45,
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
          backgroundColor: Colors.blue[50],
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Image.asset("lib/assets/images/logo.png"),
                ),
                Container(
                  child: Text(
                    "💫 KABUK DÖKÜMÜ BAŞLADI !",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  margin: EdgeInsets.all(20),
                ),
                Container(
                  child: Text(
                      '''Kabuklanma yaralanan dokunun iyileşmesi için gerekli korumayı sağlar. \n\n Kabuklanma iyileşme döneminin başladığına işaret eder.
\n\n Saç ekiminden 24 ila 72 saat sonra, kanama ve doku sıvıları kesiklerden sızmayı bırakınca saçlı derinizde küçük yara kabukları oluşturmaya başlar.

\n\n Aşırı kabuklanmayı önlemek için saç ekiminizden önce alkol, sigara ve uyuşturucu gibi maddeleri tüketmemeniz gerektiğini unutmayın. Klinik bulgular, bu tür maddelerin yara iyileşmesini kötü yönde etkilediğini ve hatta enfeksiyon ihtimalini artırdığını göstermektedir.

'''),
                  margin: EdgeInsets.all(20),
                ),
                Container(
                    margin: EdgeInsets.only(top: 30),
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
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 30),
                  alignment: Alignment.bottomCenter,
                  child: GradientElevatedButton.icon(
                    iconAlignment: IconAlignment.start,
                    onPressed: () async {
                      launchUrl(Uri.parse("tel:05068374685"));
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

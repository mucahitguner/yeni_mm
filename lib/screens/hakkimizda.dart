import 'package:flutter/material.dart';
import 'package:muratmakasci/home.dart';

class Hakkimizda extends StatefulWidget {
  const Hakkimizda({super.key});

  @override
  State<Hakkimizda> createState() => _HakkimizdaState();
}

class _HakkimizdaState extends State<Hakkimizda> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("lib/assets/images/mm-klinik.jpg"),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                      '''Saç ekimi konusunda dünyanın önde gelen ülkelerinden Türkiye/İstanbulda, dünyanın bir çok yerinden saç ekimi ve estetik operasyonlar için gelen misafirlerini memnuniyetle ağırlayan Murat Makascı Klinik, kurulduğu günden bu yana giderek artan bir başarı grafiği çizmektedir.\n\n Yaptığı çalışmalarla Uluslararası Şehir Ödüllerinde ‘Yılın En İyi Çıkış Yapan Saç Ekim Merkezi ödülüne layık görülen Murat Makascı Klinik, alanındaki gelişmeleri de yakından takip ederek hastalarına daha güncel ve daha güvenli hizmetler sunuyor.\n\n Murat Makascı Klinik bünyesindeki hizmetler;\n Saç ekimi ve tedavileri\n Sakal ekimi ve tedavileri\n Kaş ekimi ve tedavileri\n Traşsız Saç Ekimi ve Tedavileri,\n Kadınlarda Saç Ekimi ve Tedavileri,\n\n Murat Makascı Klinik bünyesinde kullanılan teknikler;\n Safir kanal tekniği\n Dhi Plus tekniği\n Fue yöntemi\n\n *Murat Makascı Klinikde ağrı ile ilgili bir endişe duymanıza gerek yok. Son teknoloji ağrısız anestezi cihazları ile daha konforlu bir operasyon için buradayız.\n\n *Operasyon öncesinde özel analiz cihazları ile bilgisayar ortamında saçlarınızın mevcut ve gelecekteki durumunu doktorunuz tarafından analiz edilir ve saç ekimi planlamanız size özel, sizinle beraber oluşturulur.\n\n Hayatınızı değiştirmek için ihtiyacınız olan tek şey sadece 2 gün!\n Operasyon takviminiz;\n 1.gün; Geliş-konsültasyon- dinlenme\n 2.gün; Operasyon-dinlenme\n\n Murat Makascı Klinik, doktorları tarafından başarı ile uygulanan son teknoloji otolog plus kök hücre tedavisi ile 1 hafta içinde eski görünümünüze kavuşmanızı garantiliyoruz.\n\n *Sizin için her şeyi düşündük!\n\n Operasyon sonrası oluşturulacak whatsapp gurubu ile operasyonunuzu yapan uzman ve danışmanınız tarafından süreciniz başarıyla sonlanana kadar takip ediliyor olacaksınız!\n\n İstanbul havaalanında vip araçlarımızla seni bekliyor olacağız.\n Tüm transfer ve konaklama planlamanız istanbula gelmeden önce sizinle paylaşılacaktır.\n\n Seyahat deneyiminiz boyunca sizinle aynı dili konuşan danışmanınız ile tüm Murat Makascı Klinik ekibi sizin için çalışır. '''),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

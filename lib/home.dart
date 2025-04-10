import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:muratmakasci/screens/NotificationScreen.dart';
import 'package:muratmakasci/service/DatabaseHelper.dart';
import 'package:muratmakasci/service/musteri_service.dart';
import 'package:muratmakasci/screens/hakkimizda.dart';
import 'package:muratmakasci/service/bildirimKontrol.dart';
import 'package:muratmakasci/service/notificationHelper.dart';
import 'model/musteri.dart';
import 'package:muratmakasci/screens/musteri_detay.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  bool sozlesmeChecked = true;
  final musteriBilgileriKey = GlobalKey();
  final TextEditingController numaraController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    numaraController.dispose();
    WidgetsBinding.instance.removeObserver(this); //arkaplan servisi için
    super.dispose();
  }

  final MusteriService musteriService = MusteriService();
  static BildirimKontrol bildirimKontrol = BildirimKontrol();

  String telefon = "";

  String _vtTelefon = "";
  static String _opTarihiBilgi = "";

  static void bildirimKapsa(String title, String body, String payload) {
    NotificationHelper.showBigTextNotification(
        title: title,
        body: body,
        fln: flutterLocalNotificationsPlugin,
        payload: payload);
  }

  bool isLoading = true;

  //
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this); //arkaplan servisi için
    _handleNotificationResponse(); //arkaplan servisi için
    NotificationHelper.initialize(flutterLocalNotificationsPlugin);
    _initializeData();
  }

  //arkaplan servisi için
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Uygulama arka plandayken ön plana geldiğinde
      // yönlendirme işlemini burada yapın
      _handleNotificationResponse();
    }
  }

  //arkaplan servisi için bildirimleri kontrol, payload bilgisi alma ve yönlendirme
  void _handleNotificationResponse() {
    flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails()
        .then((details) {
      if (details != null && details.didNotificationLaunchApp) {
        final payload = details.notificationResponse?.payload;

        if (payload != null) {
          // Yönlendirme işlemini burada yapın
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Notificationscreen(payload: payload.toString())),
          );
        }
      }
    });
  }

  Future<void> _initializeData() async {
    await _telefonAl();
    await _opAl();
    if (mounted) {
      setState(() {
        isLoading = false;
      });
      _startBackgroundService();
    }
  }

  Future<void> _telefonAl() async {
    List<Map<String, dynamic>> data = await DatabaseHelper().fetchData();
    String dataString = data.map((row) => row['telefon'].toString()).join('');
    if (mounted) {
      setState(() {
        _vtTelefon = dataString;
      });
    }
  }

  Future<void> _opAl() async {
    List<Musteri> musteriler = await musteriService.getMusteri(_vtTelefon);
    String dataString_2 =
        musteriler.map((musteri) => musteri.operasyon_tarihi).join('');
    if (mounted) {
      setState(() {
        _opTarihiBilgi = dataString_2;
      });
    }
  }

  static void _kontrolVeBildirimGonder() {
    if (_opTarihiBilgi == null) return;
    if (bildirimKontrol.bugununTarihi() == _opTarihiBilgi) {
      zamanaGoreBildirimGonder(10, "🌟Operasyon Günü Geldi !",
          "Operasyon günü detayları için dokunun.", "op_gunu");
    }
    if (bildirimKontrol.bugununTarihi() == bildirimKontrol.ikinciGun()) {
      zamanaGoreBildirimGonder(10, "🌟İlk Yıkama Vakti Geldi!",
          "İlk Yıkama Nasıl Yapılır ?", "yikama_video_ikinci_gun");
    }
    if (bildirimKontrol.bugununTarihi() == bildirimKontrol.ucuncuGun()) {
      zamanaGoreBildirimGonder(10, "📷Görüntünüzü Merak Ediyoruz!",
          "Bize Resminizi Gönderir misiniz?", "foto_sablon");
    }
    if (bildirimKontrol.bugununTarihi() == bildirimKontrol.besinciGun()) {
      zamanaGoreBildirimGonder(10, "📷Görüntünüzü Merak Ediyoruz!",
          "Bize Resminizi Gönderir misiniz?", "foto_sablon");
    }
    if (bildirimKontrol.bugununTarihi() == bildirimKontrol.sekizinciGun()) {
      zamanaGoreBildirimGonder(10, "📷Görüntünüzü Merak Ediyoruz!",
          "Bize Resminizi Gönderir misiniz?", "foto_sablon");
    }
    if (bildirimKontrol.bugununTarihi() == bildirimKontrol.onuncuGun()) {
      zamanaGoreBildirimGonder(10, "💫Kabuk Dökülme Başladı!",
          "Kabuk Dökülmesi Detaylı Bilgi Öğrenin.", "kabuk_onuncu_gun");
    }
    if (bildirimKontrol.bugununTarihi() == bildirimKontrol.ilacHatirlatmasi()) {
      zamanaGoreBildirimGonder(10, "☝️İlaçlarınızı Kullanmaya Başlayın!",
          "Operasyondan 10 Gün Geçti!", "ilac_onuncu_gun");
    }
    if (bildirimKontrol.bugununTarihi() == bildirimKontrol.prpHatirlatmasi()) {
      zamanaGoreBildirimGonder(10, "☝️1. Ayınızı Tamamladınız!",
          "Ücretsiz Prp, Lazer ve Mezoterapi Zamanı!", "prp_birinci_ay");
    }
    if (bildirimKontrol.bugununTarihi() == bildirimKontrol.birAy()) {
      zamanaGoreBildirimGonder(10, "📷Görüntünüzü Merak Ediyoruz!",
          "Bize Resminizi Gönderir misiniz?", "foto_sablon");
    }
    if (bildirimKontrol.bugununTarihi() == bildirimKontrol.ikiAy()) {
      zamanaGoreBildirimGonder(10, "📷Görüntünüzü Merak Ediyoruz!",
          "Bize Resminizi Gönderir misiniz?", "foto_sablon");
    }
    if (bildirimKontrol.bugununTarihi() == bildirimKontrol.ucAy()) {
      zamanaGoreBildirimGonder(10, "📷Görüntünüzü Merak Ediyoruz!",
          "Bize Resminizi Gönderir misiniz?", "foto_sablon");
    }
    if (bildirimKontrol.bugununTarihi() == bildirimKontrol.dortAy()) {
      zamanaGoreBildirimGonder(10, "📷Görüntünüzü Merak Ediyoruz!",
          "Bize Resminizi Gönderir misiniz?", "foto_sablon");
    }
    if (bildirimKontrol.bugununTarihi() == bildirimKontrol.besAy()) {
      zamanaGoreBildirimGonder(10, "📷Görüntünüzü Merak Ediyoruz!",
          "Bize Resminizi Gönderir misiniz?", "foto_sablon");
    }
    if (bildirimKontrol.bugununTarihi() == bildirimKontrol.altiAy()) {
      zamanaGoreBildirimGonder(10, "📷Görüntünüzü Merak Ediyoruz!",
          "Bize Resminizi Gönderir misiniz?", "foto_sablon");
    }
    if (bildirimKontrol.bugununTarihi() == bildirimKontrol.yediAy()) {
      zamanaGoreBildirimGonder(10, "📷Görüntünüzü Merak Ediyoruz!",
          "Bize Resminizi Gönderir misiniz?", "foto_sablon");
    }
    if (bildirimKontrol.bugununTarihi() == bildirimKontrol.sekizAy()) {
      zamanaGoreBildirimGonder(10, "📷Görüntünüzü Merak Ediyoruz!",
          "Bize Resminizi Gönderir misiniz?", "foto_sablon");
    }
    if (bildirimKontrol.bugununTarihi() == bildirimKontrol.dokuzAy()) {
      zamanaGoreBildirimGonder(10, "📷Görüntünüzü Merak Ediyoruz!",
          "Bize Resminizi Gönderir misiniz?", "foto_sablon");
    }
    if (bildirimKontrol.bugununTarihi() == bildirimKontrol.onAy()) {
      zamanaGoreBildirimGonder(10, "📷Görüntünüzü Merak Ediyoruz!",
          "Bize Resminizi Gönderir misiniz?", "foto_sablon");
    }
    if (bildirimKontrol.bugununTarihi() == bildirimKontrol.onbirAy()) {
      zamanaGoreBildirimGonder(10, "📷Görüntünüzü Merak Ediyoruz!",
          "Bize Resminizi Gönderir misiniz?", "foto_sablon");
    }
    if (bildirimKontrol.bugununTarihi() ==
        bildirimKontrol.yilFotoHatirlatmasi()) {
      zamanaGoreBildirimGonder(10, "☝️1 Yıl Önce Saç Ektirdiniz!",
          "Bize Resminizi Gönderir misiniz?", "foto_yil");
    }
  }

  static void zamanaGoreBildirimGonder(
      int Gun, String title, String body, String payload) {
    Timer.periodic(const Duration(seconds: 10), (_) async {
      bildirimKapsa(title, body, payload);
    });
  }

  void _startBackgroundService() async {
    final service = FlutterBackgroundService();
    service.invoke("disableBatteryOptimization");
    await service.configure(
      androidConfiguration: AndroidConfiguration(
        // this is the default configuration
        // see [AndroidConfiguration] for more details
        autoStart: true,
        isForegroundMode: false,
        onStart: onStart,
      ),
      iosConfiguration: IosConfiguration(
        // auto start will be disabled, since iOS doesn't support it
        autoStart: true,
        onBackground: onStartIos,
      ),
    );

    service.startService();
  }

  static void onStart(ServiceInstance service) {
    _kontrolVeBildirimGonder();
  }

  // ios arkaplanda çalışacak işlemler
  Future<bool> onStartIos(ServiceInstance service) async {
    _kontrolVeBildirimGonder();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    bildirimKontrol.op_al(_opTarihiBilgi);

    return MaterialApp(
      navigatorKey: navigatorKey,
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
                        child:
                            Image.asset("lib/assets/images/linkedin-icon.png")),
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
                        child:
                            Image.asset("lib/assets/images/youtube-icon.png")),
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
              Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("lib/assets/images/mm-klinik.jpg"),
                            fit: BoxFit.cover)),
                    height: 340,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          color: Colors.blue,
                          height: 45,
                          child: Icon(
                            Icons.account_box_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                            color: Colors.blue[900],
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Hasta Yönetim Uygulaması",
                              style: TextStyle(
                                  fontFamily: "Oxa",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            ))
                      ],
                    ),
                  )),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.white)),
                child: Column(
                  children: [
                    Text(
                      "Bilgilerinizi Sorgulayın !",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Oxa"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            "Telefon No (Örn: 05553336699)",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: TextField(
                          controller: numaraController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            //hintText: "Örn: 05323668656",
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: sozlesmeChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                sozlesmeChecked = value!;
                              });
                            },
                            checkColor: Colors.white),
                        Text("Açık Rıza Metnini Onaylıyorum.")
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (numaraController.text == "" ||
                                numaraController.text.trim().length <= 10) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Dikkat !"),
                                    content: Text(
                                        "Numarayı Eksik veya Hiç Girmediniz !"),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text("Kapat"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              telefon = numaraController.text;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MusteriDetay(telefon: telefon),
                                ),
                              );
                            }
                          });
                        },
                        child: Text("Giriş Yap"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

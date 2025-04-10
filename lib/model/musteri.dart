class Musteri {
  Musteri({
    required this.telefon,
    required this.adsoyad,
    required this.operasyon,
    required this.ulke,
    required this.dil,
    required this.danisman,
    required this.basvuru_tarihi,
    required this.operasyon_tarihi,
    required this.belgeler,
    required this.operasyon_tutari,
    required this.danisman_tel,
  });

  String? telefon;
  String? adsoyad;
  String? operasyon;
  String? ulke;
  String? dil;
  String? danisman;
  String? basvuru_tarihi;
  String? operasyon_tarihi;
  String? belgeler;
  String? operasyon_tutari;
  String? danisman_tel;

  Musteri.fromJson(Map<String, dynamic> json) {
    telefon = json["telefon"];
    adsoyad = json["adsoyad"];
    operasyon = json["operasyon"];
    ulke = json["ulke"];
    dil = json["dil"];
    danisman = json["danisman"];
    basvuru_tarihi = json["basvuru_tarihi"];
    operasyon_tarihi = json["operasyon_tarihi"];
    belgeler = json["belgeler"];
    operasyon_tutari = json["operasyon_tutari"];
    danisman_tel = json["danisman_tel"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data["telefon"] = telefon;
    data["adsoyad"] = adsoyad;
    data["operasyon"] = operasyon;
    data["ulke"] = ulke;
    data["dil"] = dil;
    data["danisman"] = danisman;
    data["basvuru_tarihi"] = basvuru_tarihi;
    data["operasyon_tarihi"] = operasyon_tarihi;
    data["belgeler"] = belgeler;
    data["operasyon_tutari"] = operasyon_tutari;
    data["danisman_tel"] = danisman_tel;

    return data;
  }
}

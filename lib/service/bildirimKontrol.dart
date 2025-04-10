import 'package:intl/intl.dart';

//OPERASYON TARİHİNE STRİNG İFADEYİ AYIRIP EKLENMESİ GEREKEN GÜNÜ EKLE.

final suanin_tarih_al = DateTime.now();
final DateFormat format = DateFormat('yyyy-MM-dd');
String formatliTarih = format.format(suanin_tarih_al);

/*

var tarih_ekle = Duration(days: 9, hours: 5);
    var dokuzuncu_Gun = suanin_tarih_al.add(tarih_ekle);
 */

class BildirimKontrol {
  String? bugunun_tarihi;
  String? ucuncu_Gun;
  String op_tarihi = "";
  String ileriAlinmisBildirimTarihi = "";

  void op_al(String data) {
    op_tarihi = data;
  }

  bugununTarihi() {
    bugunun_tarihi = formatliTarih;
    return bugunun_tarihi.toString();
  }

  ikinciGun() {
    if (op_tarihi != "") {
      DateTime date = DateTime.parse(op_tarihi);

      DateTime newDate = date.add(Duration(days: 2, hours: 5));

      ileriAlinmisBildirimTarihi =
          "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

      return ileriAlinmisBildirimTarihi.toString();
    }
  }

  ucuncuGun() {
    if (op_tarihi != "") {
      DateTime date = DateTime.parse(op_tarihi);

      DateTime newDate = date.add(Duration(days: 3, hours: 5));

      ileriAlinmisBildirimTarihi =
          "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

      return ileriAlinmisBildirimTarihi.toString();
    }
  }

  besinciGun() {
    if (op_tarihi != "") {
      DateTime date = DateTime.parse(op_tarihi);

      DateTime newDate = date.add(Duration(days: 5, hours: 5));

      ileriAlinmisBildirimTarihi =
          "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

      return ileriAlinmisBildirimTarihi.toString();
    }
  }

  sekizinciGun() {
    if (op_tarihi != "") {
      DateTime date = DateTime.parse(op_tarihi);

      DateTime newDate = date.add(Duration(days: 8, hours: 5));

      ileriAlinmisBildirimTarihi =
          "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

      return ileriAlinmisBildirimTarihi.toString();
    }
  }

  onuncuGun() {
    if (op_tarihi != "") {
      DateTime date = DateTime.parse(op_tarihi);

      DateTime newDate = date.add(Duration(days: 9, hours: 5));

      ileriAlinmisBildirimTarihi =
          "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

      return ileriAlinmisBildirimTarihi.toString();
    }
  }

  ilacHatirlatmasi() {
    if (op_tarihi != "") {
      DateTime date = DateTime.parse(op_tarihi);

      DateTime newDate = date.add(Duration(days: 10, hours: 5));

      ileriAlinmisBildirimTarihi =
          "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

      return ileriAlinmisBildirimTarihi.toString();
    }
  }

  prpHatirlatmasi() {
    if (op_tarihi != "") {
      DateTime date = DateTime.parse(op_tarihi);

      DateTime newDate = date.add(Duration(days: 10, hours: 5));

      ileriAlinmisBildirimTarihi =
          "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

      return ileriAlinmisBildirimTarihi.toString();
    }
  }

  birAy() {
    if (op_tarihi != "") {
      DateTime date = DateTime.parse(op_tarihi);

      DateTime newDate = date.add(Duration(days: 30, hours: 5));

      ileriAlinmisBildirimTarihi =
          "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

      return ileriAlinmisBildirimTarihi.toString();
    }
  }

  ikiAy() {
    if (op_tarihi != "") {
      DateTime date = DateTime.parse(op_tarihi);

      DateTime newDate = date.add(Duration(days: 60, hours: 5));

      ileriAlinmisBildirimTarihi =
          "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

      return ileriAlinmisBildirimTarihi.toString();
    }
  }

  ucAy() {
    if (op_tarihi != "") {
      DateTime date = DateTime.parse(op_tarihi);

      DateTime newDate = date.add(Duration(days: 90, hours: 5));

      ileriAlinmisBildirimTarihi =
          "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

      return ileriAlinmisBildirimTarihi.toString();
    }
  }

  dortAy() {
    if (op_tarihi != "") {
      DateTime date = DateTime.parse(op_tarihi);

      DateTime newDate = date.add(Duration(days: 120, hours: 5));

      ileriAlinmisBildirimTarihi =
          "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

      return ileriAlinmisBildirimTarihi.toString();
    }
  }

  besAy() {
    if (op_tarihi != "") {
      DateTime date = DateTime.parse(op_tarihi);

      DateTime newDate = date.add(Duration(days: 150, hours: 5));

      ileriAlinmisBildirimTarihi =
          "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

      return ileriAlinmisBildirimTarihi.toString();
    }
  }

  altiAy() {
    if (op_tarihi != "") {
      DateTime date = DateTime.parse(op_tarihi);

      DateTime newDate = date.add(Duration(days: 180, hours: 5));

      ileriAlinmisBildirimTarihi =
          "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

      return ileriAlinmisBildirimTarihi.toString();
    }
  }

  yediAy() {
    if (op_tarihi != "") {
      DateTime date = DateTime.parse(op_tarihi);

      DateTime newDate = date.add(Duration(days: 210, hours: 5));

      ileriAlinmisBildirimTarihi =
          "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

      return ileriAlinmisBildirimTarihi.toString();
    }
  }

  sekizAy() {
    if (op_tarihi != "") {
      DateTime date = DateTime.parse(op_tarihi);

      DateTime newDate = date.add(Duration(days: 240, hours: 5));

      ileriAlinmisBildirimTarihi =
          "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

      return ileriAlinmisBildirimTarihi.toString();
    }
  }

  dokuzAy() {
    if (op_tarihi != "") {
      DateTime date = DateTime.parse(op_tarihi);

      DateTime newDate = date.add(Duration(days: 270, hours: 5));

      ileriAlinmisBildirimTarihi =
          "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

      return ileriAlinmisBildirimTarihi.toString();
    }
  }

  onAy() {
    if (op_tarihi != "") {
      DateTime date = DateTime.parse(op_tarihi);

      DateTime newDate = date.add(Duration(days: 300, hours: 5));

      ileriAlinmisBildirimTarihi =
          "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

      return ileriAlinmisBildirimTarihi.toString();
    }
  }

  onbirAy() {
    if (op_tarihi != "") {
      DateTime date = DateTime.parse(op_tarihi);

      DateTime newDate = date.add(Duration(days: 330, hours: 5));

      ileriAlinmisBildirimTarihi =
          "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

      return ileriAlinmisBildirimTarihi.toString();
    }
  }

  yilFotoHatirlatmasi() {
    if (op_tarihi != "") {
      DateTime date = DateTime.parse(op_tarihi);

      DateTime newDate = date.add(Duration(days: 365, hours: 5));

      ileriAlinmisBildirimTarihi =
          "${newDate.year}-${newDate.month.toString().padLeft(2, '0')}-${newDate.day.toString().padLeft(2, '0')}";

      return ileriAlinmisBildirimTarihi.toString();
    }
  }

  //operasyon günü
  //Operasyondan sonraki 3.Günden itibaren fotoğraf isteme
  //9.gün kabuk dökümü hatırlatması
  //10.ilaç kullanımı hatırlatması
  //1.ay Prp-Lazer-Mezoterapi hatırlatması
  //12. ayda fotoğraf hatırlatması
}

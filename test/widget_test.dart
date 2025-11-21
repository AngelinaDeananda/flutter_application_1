void main() async {
  // tipe data variable
  print('latihan 2');
  print('-----------');
  // var
  print("variable");
  var mahasiswa = "Liana";
  var umur = 20;
  print(mahasiswa + " umur = " + umur.toString());
  print('-----------');
  // string
  print("string");
  String mahasiswaString = "Angel";
  print(mahasiswaString);
  print("-----------");
  // int
  print("integer");
  int smesterInt;
  smesterInt = 3;
  print(smesterInt);
  print('-----------');
  // double
  print("double");
  double ipkDouble = 3.5;
  print(ipkDouble);
  print('-----------');
  // boolean
  print("boolean");
  bool benarBool = true;
  bool salahBool = false;
  bool tidakBenar = !true;
  bool tidakSalah = !false;
  print("-----------");
  // list
  print("list");
  List<String> jurusanList = [
    "Teknologi Informasi",
    "Mekatronika",
    "Bahasa Jepang",
    smesterInt.toString(),
    ipkDouble.toString(),
  ];
  print(jurusanList);
  print("-----------");
  // map
  print("map");
  Map kelas = {"nama": "Melisa", "kelas": "TI 2"};
  print(kelas);
  print(kelas['nama']);
  print(kelas['kelas']);
  print('-----------');
  //  operator
  print("operator");
  int a = 10;
  int b = 5;
  print("a = " + a.toString());
  print("b = " + b.toString());
  print(a + b);
  print(a - b);
  print(a * b);
  print(a / b);
  print(a < b);
  print(a > b);
  print(a <= b);
  print(a >= b);
  print("-----------");
  // conditional
  print("conditional");
  var nilai;
  nilai = 10;
  if (nilai >= 90) {
    print("A");
  } else if (nilai <= 80 && nilai > 50) {
    print("B");
  } else {
    print("tidak lulus");
  }

  print('-----------');
  nilai >= 80 ? print("A") : print("tidak A");
  print('-----------');
  // function
  print("function");
  hitungNilai();
  var p = hitungNilai1(75, 90, 55);
  print(p);
  var A = hitungNilai2(mapel1: 50, mapel2: 80);
  print(A);
  hitungNilai3(79, 100);

  // const
  print('-----------');
  print("const");
  const String mahasiswa2 = "Angel";
  print(mahasiswa2);
  print("-----------");
  // final
  print("-----------");
  print("final");
  // bisa di inisialisasi nanti tapi hanya sekali
  final String mahasiswa3;
  mahasiswa3 = "Andrin";
  print(mahasiswa3);
  print("-----------");
  // null safety
  // (? ) untuk mengijinkan null
  // (! ) untuk memaksa tidak null
  // (late ) untuk inisialisasi nanti tapi dipastikan tidak null
  print("null safety");
  late String jurusan;
  jurusan = "Teknologi informasi";
  jurusan = "Sistem Informasi";
  jurusan = "Teknik Jaringan";
  print(jurusan.length);

  // perulangan/looping
  print("-----------");
  print("perulangan/looping");
  // for
  print("for");
  print("plus");
  for (int no = 1; no <= 5; no++) {
    print(no);
  }
  print("-----------");

  print("minus");
  for (int no = 5; no >= 1; no--) {
    print(no);
  }
  print("-----------");

  // while
  print("while");
  int no1 = 1;
  int no2 = 5;
  while (no1 <= no2) {
    print(no1);
    no1++;
  }
  // do while
  print("-----------");
  print("do while");
  int no3 = 1;
  int no4 = 5;
  do {
    print(no3);
    no3++;
  } while (no3 <= no4);
  print("-----------");
  // oop
  // membuat object
  var k1 = Kendaraan(merk: "Kijang Inova", warna: "Abu", kecepatan: 100);
  print(k1.maju(50));
  print(k1.merk);
  print(k1.warna);
  print(k1.kecepatan);

  print("-----------");
  var k2 = Kendaraan(merk: "Honda", warna: "Merah", kecepatan: 1000);
  print(k2.maju(200));
  print(k2.merk);
  print(k2.warna);
  print(k2.kecepatan);

  print("-----------");
  var s1 = Sedan(jumlahPintu: 4, kecepatanMaksimal: 120);
  print(s1.jumlahPintu);
  print(s1.kecepatanMaksimal);

  print("------------");
  func1();
  func2();
  // await func4(40)
  //     .then((value) {
  //       print(value);
  //       print("then");
  //     })
  //     .catchError((error) {
  //       print(error);
  //       print("error");
  //     });
      try{
       var value = await func4(60);
       print("try");
      }catch(error){
        print(error);
        print("error");
      }
  func3();
}

// function
hitungNilai() {
  print("hitung nilai");
}

// positional argument
hitungNilai1(mapel1, mapel2, mapel3) {
  var nilaiAkhir;
  if (mapel3 != null) {
    nilaiAkhir = mapel1 + mapel2 + mapel3;
  } else {
    nilaiAkhir = mapel1 + mapel2;
  }
  return nilaiAkhir;
}

// named argument
hitungNilai2({mapel1, mapel2}) {
  var nilaiAkhir = mapel1 + mapel2;
  return nilaiAkhir;
}

// void
void hitungNilai3(mapel1, mapel2) {
  var nilaiAkhir = mapel1 + mapel2;
  print(nilaiAkhir);
}

// class
class Kendaraan {
  // property
  String? merk;
  String? warna;
  int? kecepatan;
  // constructor
  Kendaraan({this.merk, this.warna, this.kecepatan});
  // method
  maju(int kecepatan) {
    print(kecepatan.toString() + "km/h");
  }
}
// pewarisan

class Sedan extends Kendaraan {
  int? jumlahPintu;
  int? kecepatanMaksimal;
  Sedan({String? merk, this.jumlahPintu, this.kecepatanMaksimal})
    : super(merk: merk);
}

func1() {
  print("function1");
}

func2() {
  print("function2");
}

func3() {
  print("function3");
}

Future<String> func4(int nilai) {
  return Future.delayed(Duration(seconds: 2), () {
    // return "function 4";
    // int nilai;
    if (nilai > 50) {
      return "lulus";
    } else {
      throw "tidak lulus";
    }
    // return"hitungNilai";
  });
}
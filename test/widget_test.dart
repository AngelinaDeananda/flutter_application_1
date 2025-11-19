    void main() {
    //Tipe Data Variabel
    print('Latihan 2');
    print('--------------');
  
    //Var
    var mahasiswa = 'Angel';
    var umur = 12;
  
    print(mahasiswa + 'Umur =' + umur.toString()); 
  
    //String
    String mahasiswaString;
    mahasiswaString = 'Elina';
  
    print(mahasiswaString); 
    
    //Int
    int semester;
    semester = 7;
  
    print(semester);
    
    //Double
    double ipk;
    ipk = 4;
    
    print(ipk); 
    //Boolean
    bool benar = true;
    bool salah = false;
    bool tidakbener = !true;
    bool tidaksalah = !false;
      
    //List
    List<String> jurusan = [
    'Teknologi Informasi', 
    'Mekatronika', 
    'Jepang', 
    semester.toString(), 
    ipk.toString()
 ];
      
    print(jurusan); 
    Map<String, dynamic> kelas = {
      
      'nama' : 'Caen',
      'kelas': 'TI 1',
 };
      
   print(kelas); 
   print(kelas['nama']); 
   print(kelas['kelas']); 

   //Operator
   int a, b;
   a = 6;
   b = 10;
   print ('a =' + a.toString());
   print ('a =' + b.toString());

   print(a + b);
   print(a - b);
   print(a / b);
   print(a * b);
   print(a > b);
   print(a < b);
   print(a >= b);
   print(a <= b);

   //Conditional
    print('Conditional');
    var nilai;
    nilai = 80;
    
    if (nilai >= 90){
      print('A');
    }else if(nilai <= 91 && nilai >= 50){
      print('B');
    }else{
      print('Tidak Lulus');
    }

    print('-----------');
    nilai >= 91 ? print('A'): print('Tidak A');

    // function
    print("function");

    hitungNilai();
  var p= hitungNilai1(75, 90, 55);
  print(p);
  var A= hitungNilai2(mapel1: 50, mapel2: 80);
  print(A);
  hitungNilai3(79, 100);
}
    //Function
    hitungNilai() {
    print('Hitung Nilai');
}
 //Positional Argument
 hitungNilai1(mapel1, mapel2, [mapel3]) {
  var nilaiAkhir;
 if(mapel3 != null) {
  nilaiAkhir = mapel1 / mapel2 + mapel3;
  }else{
  nilaiAkhir = mapel1 / mapel2 + mapel3;
  }
 return nilaiAkhir;
 }
 //Name Argument
 hitungNilai2({mapel1, mapel2}) {
  var nilaiAkhir;
 if(mapel2 != null) {
  nilaiAkhir = mapel1 + mapel2;
  }else{
     nilaiAkhir = mapel1;
  }
 return nilaiAkhir;
 }
 //Void
 void hitungNilai3( mapel1, mapel2) {
  var nilaiAkhir = mapel1 + mapel2;
  print(nilaiAkhir);
 }
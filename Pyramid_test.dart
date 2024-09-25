import 'dart:io';
import 'dart:math';

void main() {
  // Input jumlah angka dari user
  print('Masukkan jumlah angka yang diinginkan: ');
  int? n = int.parse(stdin.readLineSync()!);

  // Generate list angka acak
  List<int> angka = List.generate(n, (index) => Random().nextInt(1000) + 1);

  print('Angka sebelum diproses: $angka');

  // Pilihan operasi
  print('Pilih operasi yang ingin dilakukan:');
  print('1. Bubble Sort(Descending)');
  print('2. Bubble Sort(Ascending)');
  print('3. Inversi');
  print('4. Shuffle');
  int? pilihan = int.parse(stdin.readLineSync()!);

  List<int> hasil = [];

  // Proses operasi berdasarkan pilihan
  switch (pilihan) {
    case 1:
      hasil = List.from(angka);
      // Mengurutkan dari terbesar ke terkecil (Descending)
      hasil.sort((a, b) => b.compareTo(a));
      print('Hasil Urutkan dari Terbesar ke Terkecil: $hasil');
      break;
    case 2:
      hasil = List.from(angka);
      // Mengurutkan dari terkecil ke terbesar (Ascending)
      hasil.sort((a, b) => a.compareTo(b));
      print('Hasil Urutkan dari Terkecil ke Terbesar: $hasil');
      break;
    case 3:
      // Inversi (Membalik urutan)
      hasil = List.from(angka);
      hasil = hasil.reversed.toList();
      print('Hasil Inversi: $hasil');
      break;
    case 4:
      // Shuffle (Acak urutan)
      hasil = List.from(angka);
      hasil.shuffle();
      print('Hasil Shuffle: $hasil');
      break;
    default:
      print('Pilihan tidak valid.');
      return;
  }
 // Cetak piramida dari hasil operasi
  print('Piramida dari hasil operasi:');
  printPyramid(hasil);

  print('Piramida terurut Kecil ke Besar:');
  hasil.sort(); // Besar ke Kecil
  printPyramid(hasil);

  print('Piramida terurut Besar ke kecil:');
  hasil.sort((a, b) => b.compareTo(a)); // Besar ke Kecil
  printPyramid(hasil);


}


void printPyramid(List<int> hasil) {
  int totalElements = hasil.length;
  int index = 0;
  int height = 0;
  int currentRowCount = 0;

  // Menghitung tinggi maksimum piramida dan mencetak dalam satu while
  while (index < totalElements) {
    height++;
    currentRowCount += height;

    // Memusatkan piramida
    String spaces = ' ' * (totalElements - currentRowCount);

    // Mengambil elemen untuk dicetak di baris ini
    String rowElements = hasil.sublist(index, min(index + height, totalElements)).join(' ');

    // Mencetak baris piramida
    print('$spaces$rowElements');

    // Memperbarui index
    index += height;
  }
}

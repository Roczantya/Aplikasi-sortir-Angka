import 'dart:io';
import 'dart:math';

void main() {
  // Input jumlah angka dari user
  print('Masukkan jumlah angka yang diinginkan: ');
  int? n = int.parse(stdin.readLineSync()!);

  // Generate list angka acak
  List<int> angka = List.generate(n, (index) => Random().nextInt(1000) + 1);

  print('Angka sebelum diproses: $angka');

  print('Pilih operasi yang ingin dilakukan:');
  print('1. Bubble Sort (Descending)');
  print('2. Bubble Sort (Ascending)');
  print('3. Inversi');
  print('4. Shuffle');
  int? pilihan = int.parse(stdin.readLineSync()!);

  List<int> hasil = [];

  switch (pilihan) {
    case 1:
      hasil = List.from(angka);
      bubbleSort(hasil, descending: true);
      print('Hasil Urutkan dari Terbesar ke Terkecil: $hasil');
      break;
    case 2:
      hasil = List.from(angka);
      bubbleSort(hasil, descending: false);
      print('Hasil Urutkan dari Terkecil ke Terbesar: $hasil');
      break;
    case 3:
      hasil = List.from(angka);
      hasil = hasil.reversed.toList();
      print('Hasil Inversi: $hasil');
      break;
    case 4:
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
}

List<int> bubbleSort(List<int> hasil, {bool descending = false}) {
  int n = hasil.length;

  // Start the recursive sorting process
  return (n <= 1) ? hasil : _bubbleSortRecursive(hasil, n, descending);
}

List<int> _bubbleSortRecursive(List<int> hasil, int n, bool descending,
    [int index = 0]) {
  // Base case for the recursion: return if the size of the list is 1
  return (n == 1)
      ? hasil
      : ((index < n - 1)
          ? _bubbleSortRecursive(
              (descending
                  ? (hasil[index] < hasil[index + 1]
                      ? _swap(hasil, index)
                      : hasil)
                  : (hasil[index] > hasil[index + 1]
                      ? _swap(hasil, index)
                      : hasil)),
              n,
              descending,
              index + 1)
          : _bubbleSortRecursive(
              hasil, n - 1, descending) // Move to the next pass
      );
}

// Swap function to encapsulate the swapping logic
List<int> _swap(List<int> hasil, int index) {
  int temp = hasil[index];
  hasil[index] = hasil[index + 1];
  hasil[index + 1] = temp;
  return hasil; // Return the modified list
}

// Menghitung tinggi maksimum piramida dan mencetak dalam satu rekursi
void printPyramid(List<int> hasil) {
  int totalElements = hasil.length;
  int index = 0;
  int height = 0;
  int currentRowCount = 0;

  while (index < totalElements) {
    height++;
    currentRowCount += height;

    // Memusatkan piramida
    String spaces = ' ' * (totalElements - currentRowCount);

    // Mengambil elemen untuk dicetak di baris ini
    String rowElements =
        hasil.sublist(index, min(index + height, totalElements)).join(' ');

    // Mencetak baris piramida
    print('$spaces$rowElements');

    // Memperbarui index
    index += height;
  }
}

import 'package:flutter/material.dart';

class KebunRayaDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/kebunraya.jpg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(
              width: 334,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 123, 143, 123).withOpacity(0.8),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextStyle( 
                        textAlign : TextAlign.center, 
                        style :TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontSize: 23,
                          fontFamily: 'Sniglet'),  
                        child: Text('Kebun Raya Balikpapan',),
                      ),
                      SizedBox(height: 10),
                      DefaultTextStyle(
                        textAlign : TextAlign.justify,  
                        style :TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Sniglet'),  
                        child: Text('Kebun Raya Balikpapan sejak tahun 2015 pengelolaannya dilaksanakan oleh UPTD Pengelolaan oleh UPTD Pengelolaan Kebun Raya Balikpapan, yang struktur organisasinya berada dibawah SKPD Dinas Lingkungan Hidup (DLH) Kota Balikpapan dan hingga saat ini Kebun Raya Balikpapan masih terus melaksanakan pengembangan tanaman koleksi dan pembangunan infrastruktur sebagai fasilitas pendukung dalam mewujudkan tercapainya fungsi dasar sebuah Kebun Raya yaitu sebagai fungsi konservasi, pendidikan, penelitian, wisata alam dan jasa lingkungan.')
                      ),
                      SizedBox(height: 10),
                      DefaultTextStyle(
                        textAlign : TextAlign.justify,  
                        style :TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Sniglet'),  
                        child: Text('Kebun Raya Balikpapan memiliki 5 fungsi, yakni : 1. Fungsi Konservasi ex-situ; 2. Fungsi Penelitian; 3. Fungsi Pendidikan; 4. Fungsi Wisata Lingkungan; 5. Fungsi Jasa Lingkungan.',),
                      ),
                      SizedBox(height: 10),
                      DefaultTextStyle(
                        textAlign : TextAlign.justify,  
                        style :TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Sniglet'),  
                        child: Text(
                        'Kamis, 1 Desember 2005 merupakan tonggak sejarah bagi Kebun Raya Balikpapan. Ditandai dengan penyerahan masterplan Kebun Raya Balikpapan dari Kepala Lembaga Ilmu Pengetahuan Indonesia (Prof. Dr. Umar Anggara Jenie yang diwakili oleh Deputi IPH - LIPI, Bapak Prof. Dr. Endang Sukara) kepada Walikota Balikpapan (Bapak H. Imdaad Hamid, S.E.) maka secara resmi dicanangkan titik awal pembangunan Kebun Raya Balikpapan. Untuk selanjutnya tanggal 1 Desember dinyatakan sebagai hari lahir Kebun Raya Balikpapan.',),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}





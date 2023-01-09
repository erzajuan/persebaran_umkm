class Toko {
  late String name;
  late String location;
  late String description;
  late String openDays;
  late String openTime;
  late double long;
  late double lat;
  late String imageAsset;
  late List imageUrls;

  Toko({
    required this.name,
    required this.location,
    required this.description,
    required this.openDays,
    required this.openTime,
    required this.long,
    required this.lat,
    required this.imageAsset,
    required this.imageUrls,
  });
}

class Menu {
  late String harga;
  late String gambar;
  late String nama;

  Menu({
    required this.harga,
    required this.gambar,
    required this.nama,
  });
}

var tokoList = [
  Toko(
    name: 'Nasi Kucing Pak Gik',
    location: 'Jl. Inspeksi, Gabahan',
    description:
        'Nasi Kucing Pak Gik yang terletak di Jalan Inspeksi, Sekayu, Semarang. Seperti nasi kucing pada umumnya, Pak Gik menyajikan nasi dengan lauk yang porsinya sedikit',
    openDays: 'Open Everyday',
    openTime: '21:00 - 03:00',
    long: 110.4217291993808,
    lat: -6.98037870460855,
    imageAsset: 'asset/nasi-kucing-pak-gik.png',
    imageUrls: [
      Menu(
          harga: "1.000 - 3.000",
          gambar: "asset/nasi-kucing-pak-gik-1.png",
          nama: "Gorengan dan Sate"),
      Menu(
          harga: "2.000",
          gambar: "asset/nasi-kucing-pak-gik-2.png",
          nama: "Nasi Kucing"),
      Menu(harga: "3.000", gambar: "asset/es-teh.jpeg", nama: "Es Teh"),
    ],
  ),
  Toko(
    name: 'Lekker Paimo',
    location: 'Jl. Karang Anyar No.37',
    description:
        'Lekker berukuran besar menggunakan topping spesial seperti cokelat batangan, selai kacang almond, dan keju mozzarella. Kebayang kan pas lagi panas-panas keju mozzarellanya meleleh di mulut',
    openDays: 'Senin - Sabtu',
    openTime: '10:000 - 17:00',
    long: 110.42910503985772,
    lat: -6.98200470366898,
    imageAsset: 'asset/lekker-paimo.png',
    imageUrls: [
      Menu(
          harga: "5.000 - 15.000",
          gambar: "asset/lekker-paimo-1.png",
          nama: "Lekker Asin"),
      Menu(
          harga: "2.000 - 15000",
          gambar: "asset/lekker-paimo-2.png",
          nama: "Lekker Manis"),
      Menu(harga: "3.000", gambar: "asset/es-teh.jpeg", nama: "Es Teh"),
    ],
  ),
  Toko(
    name: 'Lunpia Gang Lombok',
    location: 'Gg. Lombok No.11, Purwodinatan',
    description:
        'Lumpia Gang Lombok adalah pelopor lumpia di Semarang. Jadi rasa yang dihidangkan masih otentik. Rumah makan ini menjual lumpia goreng dan basah. Disajikan bersamaan dengan bumbu kental yang gurih dan cabai rawit untuk menambah rasa pedas',
    openDays: 'Open Everyday',
    openTime: '07:000 - 17:00',
    long: 110.42801564414832,
    lat: -6.974369126931457,
    imageAsset: 'asset/lunpia-gang-lombok.png',
    imageUrls: [
      Menu(
          harga: "20.000",
          gambar: "asset/lunpia-gang-lombok-1.png",
          nama: "Lunpia Basah/Goreng"),
      Menu(harga: "3.000", gambar: "asset/es-teh.jpeg", nama: "Es Teh"),
    ],
  ),
  Toko(
    name: 'Pecel Yu Surip',
    location: 'Jl. MT. Haryono No.266',
    description:
        'Sepiring nasi pecel memiliki banyak isian sayur, seperti kangkung, kacang panjang, kubis, toge, wortel dan lainnya yang diguyur sambal kacang',
    openDays: 'Open Everyday',
    openTime: '17:00 - 22:00',
    long: 110.43111011822121,
    lat: -6.975605488552014,
    imageAsset: 'asset/pecel-yu-surip.png',
    imageUrls: [
      Menu(harga: "3.000", gambar: "asset/pecel-yu-surip-1.png", nama: "Sate"),
      Menu(harga: "9.000", gambar: "asset/pecel-yu-surip-2.png", nama: "Pecel"),
      Menu(harga: "3.000", gambar: "asset/es-teh.jpeg", nama: "Es Teh"),
    ],
  ),
  Toko(
    name: 'Sate dan Gule Kambing 29',
    location: 'Jl. Letjen Suprapto No.29',
    description:
        'Kambing bakar, olahan domba & sate klasik lain disajikan di resto luas plus dinding penuh dengan karya seni.',
    openDays: 'Senin - Sabtu',
    openTime: '08:00 - 21:00',
    long: 110.42763280107144,
    lat: -6.968474526718209,
    imageAsset: 'asset/sate-kambing-29.jpeg',
    imageUrls: [
      Menu(harga: "5.000", gambar: "asset/es-teh.jpeg", nama: "Es Teh"),
      Menu(
          harga: "85.000",
          gambar: "asset/Sate-29.png",
          nama: "Sate Campur Daging/Ati"),
      Menu(
          harga: "50.000", gambar: "asset/Sate-29-1.png", nama: "Gule Kambing"),
    ],
  ),
  Toko(
    name: 'Nasi Ayam Bu Nyoto',
    location: 'Jalan Mayjen Jl. MT. Haryono',
    description:
        'Nasi ayam berupa nasi putih biasa atau nasi gurih yang disajikan bersama suwiran ayam, potongan telur ayam, krecek, potongan tahu lalu disiram dengan kuah labu Siam dan kuah opor.',
    openDays: 'Open Everyday',
    openTime: '06:30 - 09:00',
    long: 110.432149851725,
    lat: -6.9960283034386865,
    imageAsset: 'asset/nasi-ayam-bu-nyoto.png',
    imageUrls: [
      Menu(
          harga: "15.000",
          gambar: "asset/nasi-ayam-bu-nyoto-1.png",
          nama: "Nasi Ayam"),
      Menu(harga: "3.000", gambar: "asset/es-teh.jpeg", nama: "Es Teh"),
    ],
  ),
  Toko(
    name: 'Nasi Gandul Pak Memet',
    location: 'Jalan Dokter Cipto No.12, Bugangan',
    description:
        'Disajikan dengan alas daun pisang, nasinya diguyur dengan kuah kaldu sapi dan daging yang fresh baru dimasak dari kuali. Sambal dan kecap manisnya juga asli buatan rumahan sehingga menambah keaslian rasa. Makanan pendamping nasi gandul berupa perkedel dan tempe.',
    openDays: 'Open Everyday',
    openTime: '16:30 - 21:30',
    long: 110.43408298231722,
    lat: -6.970520954760399,
    imageAsset: 'asset/nasi-gandul-pak-memet.png',
    imageUrls: [
      Menu(
          harga: "7.000 - 1.0000",
          gambar: "asset/nasi-gandul-pak-memet-1.png",
          nama: "Nasi Kuah"),
      Menu(
          harga: "2.000",
          gambar: "asset/nasi-gandul-pak-memet-2.png",
          nama: "Gorengan"),
      Menu(harga: "3.000", gambar: "asset/es-teh.jpeg", nama: "Es Teh"),
    ],
  ),
  Toko(
    name: 'Andjani Indonesia',
    location: 'Jl. Jeruk IV No.29, Lamper Lor',
    description:
        'ANDJANI merupakan sebuah brand asli Indonesia yang berdiri sejak tahun 2012. ANDJANI menemukan bahwa batik dan tenun merupakan salah satu budaya Indonesia yang sangat indah, unik dan merupakan warisan bangsa yang sangat berharga. Oleh sebab itu ANDJANI dengan bangga mengusung keindahan budaya Indonesia dalam rupa buah karya anak bangsa dari berbagai daerah yang didesain dalam bentuk tas.',
    openDays: 'Senin - Sabtu',
    openTime: '10:00 - 16:00',
    long: 110.43408298231722,
    lat: -6.970520954760399,
    imageAsset: 'asset/andjani.png',
    imageUrls: [
      Menu(
          harga: "800.000 - 2000.000",
          gambar: "asset/andjani-1.png",
          nama: "Tas"),
      Menu(harga: "350.000", gambar: "asset/andjani-2.png", nama: "Dompet"),
    ],
  ),
];

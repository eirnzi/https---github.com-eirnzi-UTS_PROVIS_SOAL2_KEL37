import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tokoo App UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Image.network(
                  'https://picsum.photos/id/490/300/200', // Ganti dengan URL gambar latar Anda
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Text(
                        'Halo, Budi!',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Material(
                        elevation: 6.0,
                        borderRadius: BorderRadius.circular(30.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.search),
                            ),
                            hintText: "Cari barang di Tokoo",
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.account_balance_wallet, color: Colors.orange),
                          Text('Store Credit'),
                          Text('Rp.0'),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.star, color: Colors.orange),
                          Text('Reward Point'),
                          Text('100 Point'),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.card_giftcard, color: Colors.orange),
                          Text('Kupon Saya'),
                          Text('11 Kupon'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              children: List.generate(4, (index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.widgets, // Ganti dengan ikon yang sesuai
                      color: Colors.orange,
                    ),
                    Text('Kategori ${index + 1}'), // Ganti dengan teks yang sesuai
                  ],
                );
              }),
            ),
            SizedBox(height: 16.0),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(), // untuk menghilangkan scroll pada ListView
              shrinkWrap: true,
              itemCount: 10, // Jumlah item dalam list
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network('https://via.placeholder.com/100'), // Ganti dengan gambar item
                    title: Text('Item $index'), // Ganti dengan nama item
                    subtitle: Text('Deskripsi item $index'), // Ganti dengan deskripsi item
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Kategori',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'List Belanja',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
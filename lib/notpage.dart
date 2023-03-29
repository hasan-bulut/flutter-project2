import 'package:flutter/material.dart';
import 'package:hasan_bulut_651/ortalama.dart';

class NotPage extends StatelessWidget {
  NotPage(
      {super.key,
      required this.isim,
      required this.numara,
      required this.sube});
  String isim, numara, sube;
  TextEditingController notController = TextEditingController();
  List<int> notlar = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Not Giriş Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
                "http://www.bakaml-forum.com/images/ogrenci/resim/11-E/651.jpg"),
          ),
          Text(
            this.isim,
            style: TextStyle(fontSize: 15),
          ),
          Text(
            this.sube,
            style: TextStyle(fontSize: 15),
          ),
          Text(
            this.numara,
            style: TextStyle(fontSize: 15),
          ),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  controller: notController,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              )),
          SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                if (notController.text != "" &&
                    int.tryParse(notController.text) != null) {
                  notlar.add(int.parse(notController.text));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Eklendi"),
                      backgroundColor: Colors.green,
                    ),
                  );
                  notController.text = "";
                }
              },
              child: Text("Ekle"),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrtalamaPage(
                  notlar: notlar,
                ),
              ));
        },
        child: Icon(Icons.view_list_rounded),
      ),
    );
  }
}

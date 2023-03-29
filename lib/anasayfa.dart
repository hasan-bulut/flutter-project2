import 'package:flutter/material.dart';
import 'package:hasan_bulut_651/notpage.dart';

class Anasayfa extends StatelessWidget {
  const Anasayfa({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController isimController = TextEditingController();
    TextEditingController numaraController = TextEditingController();
    TextEditingController subeController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Bilgilerinizi giriniz",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ad Soyad"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        controller: isimController,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Numara"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        controller: numaraController,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sınıf Şube"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        controller: subeController,
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  if (isimController.text != "" &&
                      numaraController.text != "" &&
                      subeController.text != "") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotPage(
                          isim: isimController.text,
                          numara: numaraController.text,
                          sube: subeController.text,
                        ),
                      ),
                    );
                  }
                },
                child: Text("Kaydet"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

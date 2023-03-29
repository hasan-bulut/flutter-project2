import 'package:flutter/material.dart';
import 'package:hasan_bulut_651/notpage.dart';

class OrtalamaPage extends StatefulWidget {
  OrtalamaPage({super.key, required this.notlar});
  List<int> notlar = [];

  @override
  State<OrtalamaPage> createState() => _OrtalamaPageState();
}

class _OrtalamaPageState extends State<OrtalamaPage> {
  @override
  Widget build(BuildContext context) {
    double ortalama = 0.0;
    List<Widget> notlarWidget = [];
    if (widget.notlar.length > 0) {
      for (var element in widget.notlar) {
        ortalama += element;
        notlarWidget.add(Card(
          child: ListTile(
            title: Text(element.toString()),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Silmek istediğinizden emin misiniz?"),
                    content: Text(element.toString()),
                    actions: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            widget.notlar.remove(element);
                            Navigator.pop(context);
                          });
                        },
                        child: Text("Evet"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Hayır"),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ));
      }
      ortalama = ortalama / widget.notlar.length;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Ortalama"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                "Ortalama",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                ortalama.toString(),
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
              Column(
                children: notlarWidget,
              )
            ],
          ),
        ),
      ),
    );
  }
}

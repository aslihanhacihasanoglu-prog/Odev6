import 'package:flutter/material.dart';
import 'package:odev6/spor_giyim.dart';
import 'package:odev6/ust_giyim.dart';


import 'aksesuar.dart';
import 'detay_sayfa.dart';
import 'dis_giyim.dart';
import 'kiyafetler.dart';

class KiyafetlerSayfa extends StatefulWidget {
  const KiyafetlerSayfa({super.key});

  @override
  State<KiyafetlerSayfa> createState() => _KiyafetlerSayfaState();
}

class _KiyafetlerSayfaState extends State<KiyafetlerSayfa> {

  Future<List<Kiyafetler>> urunleriYukle() async {
    var urunlerListesi = <Kiyafetler>[];
    var u1 = Kiyafetler(id: 1 , ad: "Üst Giyim", resim : "ustgiyim.png");
    var u2 = Kiyafetler(id: 2 , ad: "Dış Giyim", resim : "disgiyim.png");
    var u3 = Kiyafetler(id: 3 , ad: "Spor Giyim", resim : "sporgiyim.png");
    var u4 = Kiyafetler(id: 4 , ad: "Aksesuarlar", resim : "aksesuar.png");

    urunlerListesi.add(u1);
    urunlerListesi.add(u2);
    urunlerListesi.add(u3);
    urunlerListesi.add(u4);

    return urunlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ürünler"),),
      body: FutureBuilder(
        future: urunleriYukle(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var kiyafetListesi = snapshot.data;
            return ListView.builder(
              itemCount: kiyafetListesi!.length,
              itemBuilder: (context, index) {
                var kiyafet=kiyafetListesi[index];
                return GestureDetector(

                  onTap: () {
                    switch (index) {
                      case 0:
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              UstGiyimSayfa()),
                        );
                        break;
                      case 1:
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              DisGiyimSayfa()),
                        );
                        break;
                      case 2:
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              SporGiyimSayfa()),
                        );
                        break;
                      case 3:
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              AksesuarSayfa()),
                        );
                        break;
                    }
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(width: 128,height: 128,
                              child: Image.asset("assets/images/${kiyafet.resim}")),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(kiyafet.ad),
                            SizedBox(height: 8,),
                            SizedBox(height: 16,),

                          ],
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                ),
                    );
                  },
                );
              }else{
            return const Center();
            }
            },
            ),
          );
        }
}

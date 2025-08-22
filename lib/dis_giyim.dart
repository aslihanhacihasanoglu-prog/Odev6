import 'package:flutter/material.dart';


import 'detay_sayfa.dart';
import 'kiyafetler.dart';

class DisGiyimSayfa extends StatefulWidget {
  const DisGiyimSayfa({super.key});

  @override
  State<DisGiyimSayfa> createState() => _DisGiyimSayfaState();
}

class _DisGiyimSayfaState extends State<DisGiyimSayfa> {

  Future<List<Kiyafetler>> urunleriYukle() async {
    var urunlerListesi = <Kiyafetler>[];
    var u1 = Kiyafetler(id: 1 , ad: "Kaban", resim : "kaban.jpg");
    var u2 = Kiyafetler(id: 2 , ad: "Yelek", resim : "yelek.jpg");
    var u3 = Kiyafetler(id: 3 , ad: "Mont", resim : "mont.jpg");


    urunlerListesi.add(u1);
    urunlerListesi.add(u2);
    urunlerListesi.add(u3);

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
            var filmlerListesi = snapshot.data;
            return ListView.builder(
              itemCount: filmlerListesi!.length,
              itemBuilder: (context, indeks){
                var urun = filmlerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(urun: urun)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(width: 128,height: 128,
                              child: Image.asset("assets/images/${urun.resim}")),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(urun.ad),
                            SizedBox(height: 8,),
                            SizedBox(height: 16,),
                            ElevatedButton(onPressed: (){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("${urun.ad} sepete eklendi."))
                              );
                            }, child: const Text("Sepete Ekle")),
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

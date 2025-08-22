import 'package:flutter/material.dart';


import 'detay_sayfa.dart';
import 'kiyafetler.dart';

class AksesuarSayfa extends StatefulWidget {
  const AksesuarSayfa({super.key});

  @override
  State<AksesuarSayfa> createState() => _AksesuarSayfaState();
}

class _AksesuarSayfaState extends State<AksesuarSayfa> {

  Future<List<Kiyafetler>> urunleriYukle() async {
    var urunlerListesi = <Kiyafetler>[];
    var u1 = Kiyafetler(id: 1 , ad: "Bileklik", resim : "bileklik.jpg");
    var u2 = Kiyafetler(id: 2 , ad: "Toka", resim : "toka.jpg");


    urunlerListesi.add(u1);
    urunlerListesi.add(u2);

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

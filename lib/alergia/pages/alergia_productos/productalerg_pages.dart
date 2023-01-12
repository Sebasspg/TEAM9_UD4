import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/alergia/pages/alergia_productos/alergycreate_pages.dart';
import 'package:team9_ud3_project/alergia/pages/alergia_productos/updatealerg_pages.dart';
import 'package:team9_ud3_project/providers/alergia_provider.dart';

class ProductosAlergiaPage extends StatelessWidget {
  const ProductosAlergiaPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    final productoData = Provider.of<AlergiaProvider>(context);
    productoData.queryAllA();
    return Scaffold(
          appBar: AppBar(
           
        backgroundColor: Colors.white,
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [const Text('REGISTRO DE ALERGIAS',style: TextStyle( fontWeight: FontWeight.bold,fontSize: 16), ),
        Image.asset('assets/alergia/login_logo.png', scale: 3,),
        ],
        ),
        
        centerTitle: true,

         ),
        
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children:[
            SizedBox(
              child: Image.asset('assets/alergia/alergiaim.png'),
            ),          
            Column(
              children:[   
                const SizedBox(
                  height: 45,
                ),     
             Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            "MIS ALERGIAS",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 15,
                          )
                        ],
                      ),
                      ],
            ),
                      ],
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: productoData.product.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = productoData.product[index];

            return ListTile(
              title: Text('${data.nombre} /Alergico a ${data.categoria}  '),
              subtitle: Text('detectado el ${data.describe} '),
              trailing: IconButton(
                onPressed: () {
                  productoData.delete(data.id);
                },
                icon: const Icon(
                  Icons.delete_outline_outlined,
                  color: Colors.red,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateAlergiaPage(
                      product: data,
                    ),
                  ),
                );
              },
            );
          },
        ),
            ),
            
               InkWell(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                       gradient: const LinearGradient(colors: <Color>[
                     Color.fromARGB(255, 120, 87, 204),
                     Color.fromARGB(255, 74, 133, 215),
                     Color.fromARGB(255, 34, 172, 223),
                     ],
                     ),),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "AÑADIR ALERGIA",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Image.asset('assets/medicinas/flechamed.png', alignment: Alignment.centerRight,scale: 3.5,),
                    ],
                  ),
                ),
                onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CreateAlergiaPage()));
                },
              ),
    ]
        ),
      ),
      
    );
    
  }
}

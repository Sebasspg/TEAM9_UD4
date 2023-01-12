import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team9_ud3_project/medicacion/pages/medicaci%C3%B3n/crearmedicacion_pages.dart';
import 'package:team9_ud3_project/medicacion/pages/medicaci%C3%B3n/updatemedicina_pages.dart';
import 'package:team9_ud3_project/providers/Medicina_provider.dart';

class ProductosMedicinaPage extends StatelessWidget {
  const ProductosMedicinaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productoData = Provider.of<MedicinaProvider>(context);
    productoData.queryAllM();
    return Scaffold(
      appBar: AppBar(
           
        backgroundColor: Colors.white,
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [const Text('MEDICACION',style: TextStyle( fontWeight: FontWeight.bold,fontSize: 22), ),
        Image.asset('assets/alergia/login_logo.png', scale: 3),
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
              child: Image.asset('assets/medicinas/medicinasmed.png')
            ),        
              Column(
                children:[   
                  const SizedBox(
                    height: 45,
                  ),     
               Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              "MIS MEDICINAS",
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
            title: Text('Vía ${data.nombre} : ${data.categoria}'),
            subtitle: Text('Inicio: ${data.fin} ${data.inicio} | cada ${data.intervalo} hora(s)'),
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
                  builder: (context) => UpdateMedicinaPage(
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
                     Color.fromARGB(233, 115, 159, 203),
                     Color.fromARGB(255, 34, 172, 223),
                     ],
                     ),),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "AÑADIR MEDICINA",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Image.asset('assets/medicinas/flechamed.png', alignment: Alignment.centerRight,scale: 3.5,),
                    ],
                  ),
                ),
                onTap: () {             
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CreateMedicinaPage()));

                }

              ),
          ],
            ),
      )
    );
  }
}

import 'package:flutter/material.dart';

class Recomendaciones extends StatefulWidget {
  const Recomendaciones({super.key});

  @override
  State<Recomendaciones> createState() => _RecomendacionesState();
}

class _RecomendacionesState extends State<Recomendaciones> {
  List<int> items = List<int>.generate(5, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('RECOMENDACIONES'),
        toolbarHeight: 60,
      ),
      body: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            background: Container(
              color: const Color.fromARGB(255, 134, 223, 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                  Text('IGNORAR :,3'),
                  SizedBox(width: 10,),
                  Icon(Icons.check_circle_outline),
                ],
              ),
            ),
            key: ValueKey<int>(items[index]),
            onDismissed: (DismissDirection direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            child: Column(
              children: [
                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 130,
                    color: Colors.lightGreen,
                    child: const Center(
                      child: ListTile(
                        title: Text('TÌTULO DE LA RECOMENDACIÓN'),
                        subtitle: Text('TEXTITO DE DESCRIPCIÓN :3'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
              ],
            ),
          );
        },
      ),
    );
  }
}

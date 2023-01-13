import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TerminosCondiciones extends StatefulWidget {
  const TerminosCondiciones({super.key});

  @override
  State<TerminosCondiciones> createState() => _TerminosCondicionesState();
}

class _TerminosCondicionesState extends State<TerminosCondiciones> {
  var colorbienceleste = const Color.fromARGB(255, 51, 198, 244);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: FittedBox(
                          child: FloatingActionButton(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            child: Image.asset(
                                'assets/menuprincipal/bien/flecha_negra_volver.png'),
                            onPressed: () {
                              Navigator.pop(
                                (context),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.046,
                      ),
                      Image.asset(
                        'assets/login/login_logo.png',
                        width: MediaQuery.of(context).size.width * 0.245,
                        // fit: BoxFit.fill,
                        // isAntiAlias: true,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.08,
              ),
              Text(
                "Términos y Condiciones ",
                style: GoogleFonts.quicksand(
                    fontSize: 19.7, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.06,
              ),
              Column(
                children: [
                  Text(
                    "1. Estos Términos y Condiciones de Uso regulan las reglas a que se sujeta la utilización de Gux Health, que puede descargarse desde el dominio AppCube. La descarga o utilización de la APP atribuye la condición de Usuario a quien lo haga e implica la aceptación de todas las condiciones incluidas en este documento y en la Política de Privacidad y el Aviso Legal de dicha página Web. El Usuario debería leer estas condiciones cada vez que utilice Gux Health, ya que podrían ser modificadas en lo sucesivo.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "2. Únicamente los Usuarios expresamente autorizados por Appcube podrán acceder a la descarga y uso de Gux Health. Los Usuarios que no dispongan de autorización, no podrán acceder a dicho contenido. ",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "3. Cargos: eres responsable del pago de todos los costes o gastos en los que incurras como resultado de descargar y usar la Aplicación de AppCube, incluido cualquier cargo de red de operador o itinerancia. Consulta con tu proveedor de servicios los detalles al respecto.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "4. Estadísticas anónimas: AppCube se reserva el derecho a realizar un seguimiento de tu actividad en la Aplicación de y a informar de ello a nuestros proveedores de servicios estadísticos de terceros. Todo ello de forma anónima.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "5. Protección de tu información personal: queremos ayudarte a llevar a cabo todos los pasos necesarios para proteger tu privacidad e información. Consulta la Política de privacidad de AppCube y los avisos sobre privacidad de la Aplicación para conocer qué tipo de información recopilamos y las medidas que tomamos para proteger tu información personal.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "6. Queda prohibido alterar o modificar ninguna parte de Gux Health a de los contenidas de la misma, eludir, desactivar o manipular de cualquier otra forma (o tratar de eludir, desactivar o manipular) las funciones de seguridad u otras funciones del programa y utilizar Gux Health o sus contenidos para un fin comercial o publicitario. Queda prohibido el uso de Gux Health con la finalidad de lesionar bienes, derechos o intereses de AppCube o de terceros. Queda igualmente prohibido realizar cualquier otro uso que altere, dañe o inutilice las redes, servidores, equipos, productos y programas informáticos de AppCube o de terceros.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "7. Gux Health y sus contenidos (textos, fotografías, gráficos, imágenes, tecnología, software, links, contenidos, diseño gráfico, código fuente, etc.), así como las marcas y demás signos distintivos son propiedad de AppCube o de terceros, no adquiriendo el Usuario ningún derecho sobre ellos por el mero uso de Gux Health. El Usuario, deberá abstenerse de: a) Reproducir, copiar, distribuir, poner a disposición de terceros, comunicar públicamente, transformar o modificar la APP o sus contenidos, salvo en los casos contemplados en la ley o expresamente autorizados por AppCube o por el titular de dichos derechos. b) Reproducir o copiar para uso privado Gux Health o sus contenidos, así como comunicarlos públicamente o ponerlos a disposición de terceros cuando ello conlleve su reproducción. c) Extraer o reutilizar todo o parte sustancial de los contenidos integrantes de la APP.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "8. Con sujeción a las condiciones establecidas en el apartado anterior, AppCube concede al Usuario una licencia de uso de la APP, no exclusiva, gratuita, para uso personal, circunscrita al territorio nacional y con carácter indefinido. Dicha licencia se concede también en los mismos términos con respecto a las actualizaciones y mejoras que se realizasen en la aplicación. Dichas licencias de uso podrán ser revocadas por AppCube unilateralmente en cualquier momento, mediante la mera notificación al Usuario.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "9. Corresponde al Usuario, en todo caso, disponer de herramientas adecuadas para la detección y desinfección de programas maliciosos o cualquier otro elemento informático dañino. AppCube no se responsabiliza de los daños producidos a equipos informáticos durante el uso de la APP. Igualmente, Appcube no será responsable de los daños producidos a los Usuarios cuando dichos daños tengan su origen en fallos o desconexiones en las redes de telecomunicaciones que interrumpan el servicio.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "10. IMPORTANTE: Podemos, sin que esto suponga ninguna obligación contigo, modificar estas Condiciones de uso sin avisar en cualquier momento. Si continúas utilizando la aplicación una vez realizada cualquier modificación en estas Condiciones de uso, esa utilización continuada constituirá la aceptación por tu parte de tales modificaciones. Si no aceptas estas condiciones de uso ni aceptas quedar sujeto a ellas, no debes utilizar la aplicación ni descargar o utilizar cualquier software relacionado. El uso que hagas de la aplicación queda bajo tu única responsabilidad. No tenemos responsabilidad alguna por la eliminación o la incapacidad de almacenar o trasmitir cualquier contenido u otra información mantenida o trasmitida por la aplicación. No somos responsables de la precisión o la fiabilidad de cualquier información o consejo trasmitidos a través de la aplicación. Podemos, en cualquier momento, limitar o interrumpir tu uso a nuestra única discreción. Hasta el máximo que permite la ley, en ningún caso seremos responsables por cualquier pérdida o daño relacionados.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "11. El Usuario se compromete a hacer un uso correcto de la APP, de conformidad con la Ley, con los presentes Términos y Condiciones de Uso y con las demás reglamentos e instrucciones que, en su caso, pudieran ser de aplicación El Usuario responderá frente a AppCube y frente a terceros de cualesquiera daños o perjuicios que pudieran causarse por incumplimiento de estas obligaciones.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "12. Estos Términos y Condiciones de Uso se rigen íntegramente por la legislación española. Para la resolución de cualquier conflicto relativo a su interpretación o aplicación, el Usuario se somete expresamente a la jurisdicción de los tribunales de Perú",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                child: MaterialButton(
                  minWidth: double.infinity,
                  color: colorbienceleste,
                  onPressed: () {
                    Navigator.pop(
                      (context),
                    );
                  },
                  child: Text(
                    'ENTENDIDO',
                    style: GoogleFonts.quicksand(
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

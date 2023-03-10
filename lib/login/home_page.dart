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
                "T??rminos y Condiciones ",
                style: GoogleFonts.quicksand(
                    fontSize: 19.7, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.06,
              ),
              Column(
                children: [
                  Text(
                    "1. Estos T??rminos y Condiciones de Uso regulan las reglas a que se sujeta la utilizaci??n de Gux Health, que puede descargarse desde el dominio AppCube. La descarga o utilizaci??n de la APP atribuye la condici??n de Usuario a quien lo haga e implica la aceptaci??n de todas las condiciones incluidas en este documento y en la Pol??tica de Privacidad y el Aviso Legal de dicha p??gina Web. El Usuario deber??a leer estas condiciones cada vez que utilice Gux Health, ya que podr??an ser modificadas en lo sucesivo.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "2. ??nicamente los Usuarios expresamente autorizados por Appcube podr??n acceder a la descarga y uso de Gux Health. Los Usuarios que no dispongan de autorizaci??n, no podr??n acceder a dicho contenido. ",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "3. Cargos: eres responsable del pago de todos los costes o gastos en los que incurras como resultado de descargar y usar la Aplicaci??n de AppCube, incluido cualquier cargo de red de operador o itinerancia. Consulta con tu proveedor de servicios los detalles al respecto.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "4. Estad??sticas an??nimas: AppCube se reserva el derecho a realizar un seguimiento de tu actividad en la Aplicaci??n de y a informar de ello a nuestros proveedores de servicios estad??sticos de terceros. Todo ello de forma an??nima.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "5. Protecci??n de tu informaci??n personal: queremos ayudarte a llevar a cabo todos los pasos necesarios para proteger tu privacidad e informaci??n. Consulta la Pol??tica de privacidad de AppCube y los avisos sobre privacidad de la Aplicaci??n para conocer qu?? tipo de informaci??n recopilamos y las medidas que tomamos para proteger tu informaci??n personal.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "6. Queda prohibido alterar o modificar ninguna parte de Gux Health a de los contenidas de la misma, eludir, desactivar o manipular de cualquier otra forma (o tratar de eludir, desactivar o manipular) las funciones de seguridad u otras funciones del programa y utilizar Gux Health o sus contenidos para un fin comercial o publicitario. Queda prohibido el uso de Gux Health con la finalidad de lesionar bienes, derechos o intereses de AppCube o de terceros. Queda igualmente prohibido realizar cualquier otro uso que altere, da??e o inutilice las redes, servidores, equipos, productos y programas inform??ticos de AppCube o de terceros.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "7. Gux Health y sus contenidos (textos, fotograf??as, gr??ficos, im??genes, tecnolog??a, software, links, contenidos, dise??o gr??fico, c??digo fuente, etc.), as?? como las marcas y dem??s signos distintivos son propiedad de AppCube o de terceros, no adquiriendo el Usuario ning??n derecho sobre ellos por el mero uso de Gux Health. El Usuario, deber?? abstenerse de: a) Reproducir, copiar, distribuir, poner a disposici??n de terceros, comunicar p??blicamente, transformar o modificar la APP o sus contenidos, salvo en los casos contemplados en la ley o expresamente autorizados por AppCube o por el titular de dichos derechos. b) Reproducir o copiar para uso privado Gux Health o sus contenidos, as?? como comunicarlos p??blicamente o ponerlos a disposici??n de terceros cuando ello conlleve su reproducci??n. c) Extraer o reutilizar todo o parte sustancial de los contenidos integrantes de la APP.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "8. Con sujeci??n a las condiciones establecidas en el apartado anterior, AppCube concede al Usuario una licencia de uso de la APP, no exclusiva, gratuita, para uso personal, circunscrita al territorio nacional y con car??cter indefinido. Dicha licencia se concede tambi??n en los mismos t??rminos con respecto a las actualizaciones y mejoras que se realizasen en la aplicaci??n. Dichas licencias de uso podr??n ser revocadas por AppCube unilateralmente en cualquier momento, mediante la mera notificaci??n al Usuario.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "9. Corresponde al Usuario, en todo caso, disponer de herramientas adecuadas para la detecci??n y desinfecci??n de programas maliciosos o cualquier otro elemento inform??tico da??ino. AppCube no se responsabiliza de los da??os producidos a equipos inform??ticos durante el uso de la APP. Igualmente, Appcube no ser?? responsable de los da??os producidos a los Usuarios cuando dichos da??os tengan su origen en fallos o desconexiones en las redes de telecomunicaciones que interrumpan el servicio.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "10. IMPORTANTE: Podemos, sin que esto suponga ninguna obligaci??n contigo, modificar estas Condiciones de uso sin avisar en cualquier momento. Si contin??as utilizando la aplicaci??n una vez realizada cualquier modificaci??n en estas Condiciones de uso, esa utilizaci??n continuada constituir?? la aceptaci??n por tu parte de tales modificaciones. Si no aceptas estas condiciones de uso ni aceptas quedar sujeto a ellas, no debes utilizar la aplicaci??n ni descargar o utilizar cualquier software relacionado. El uso que hagas de la aplicaci??n queda bajo tu ??nica responsabilidad. No tenemos responsabilidad alguna por la eliminaci??n o la incapacidad de almacenar o trasmitir cualquier contenido u otra informaci??n mantenida o trasmitida por la aplicaci??n. No somos responsables de la precisi??n o la fiabilidad de cualquier informaci??n o consejo trasmitidos a trav??s de la aplicaci??n. Podemos, en cualquier momento, limitar o interrumpir tu uso a nuestra ??nica discreci??n. Hasta el m??ximo que permite la ley, en ning??n caso seremos responsables por cualquier p??rdida o da??o relacionados.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "11. El Usuario se compromete a hacer un uso correcto de la APP, de conformidad con la Ley, con los presentes T??rminos y Condiciones de Uso y con las dem??s reglamentos e instrucciones que, en su caso, pudieran ser de aplicaci??n El Usuario responder?? frente a AppCube y frente a terceros de cualesquiera da??os o perjuicios que pudieran causarse por incumplimiento de estas obligaciones.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.quicksand(
                        fontSize: 10.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "12. Estos T??rminos y Condiciones de Uso se rigen ??ntegramente por la legislaci??n espa??ola. Para la resoluci??n de cualquier conflicto relativo a su interpretaci??n o aplicaci??n, el Usuario se somete expresamente a la jurisdicci??n de los tribunales de Per??",
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

import 'dart:io';

import 'package:crypto_font_icons/crypto_font_icon_data.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navegacao_telas_app/profile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class Moeda {
  String name = "", logo, price, rank;
  Moeda(this.name, this.price, this.rank, this.logo);

  Moeda.fromJson(Map<String, dynamic> json):
        name = json['name'],
        rank = json['rank'],
        price = json['priceUsd'],
        logo = json['symbol'];
}

recuperaMoeda() async{
  try {
    var response = await http.get(Uri.parse("http://api.coincap.io/v2/assets"));
    var moedasJson = Map<String, dynamic>.from(json.decode(response.body));
    var moedas = <Moeda>[];
    for (var moeda in moedasJson.values.first) {
      moedas.add(Moeda.fromJson(moeda));
    }

    return moedas;
  }catch(err){
    print("ERRO $err");
  }
  return null;
}

final Map<String, CryptoFontIconData> cryptoIcon = {
  'ADC' : CryptoFontIcons.ADC,
  'AEON' : CryptoFontIcons.AEON,
  'AMP' : CryptoFontIcons.AMP,
  'ANC' : CryptoFontIcons.ANC,
  'ARDR' : CryptoFontIcons.ARDR,
  'AUR' : CryptoFontIcons.AUR,
  'BAY' : CryptoFontIcons.BAY,
  'BCN' : CryptoFontIcons.BCN,
  'BRK' : CryptoFontIcons.BRK,
  'BRX' : CryptoFontIcons.BRX,
  'BSD' : CryptoFontIcons.BSD,
  'BTA' : CryptoFontIcons.BTA,
  'BTC' : CryptoFontIcons.BTC,
  'BTC_ALT' : CryptoFontIcons.BTC_ALT,
  'BTCD' : CryptoFontIcons.BTCD,
  'BTS' : CryptoFontIcons.BTS,
  'CLAM' : CryptoFontIcons.CLAM,
  'CLOAK' : CryptoFontIcons.CLOAK,
  'DASH' : CryptoFontIcons.DASH,
  'DCR' : CryptoFontIcons.DCR,
  'DGB' : CryptoFontIcons.DGB,
  'DGD' : CryptoFontIcons.DGD,
  'DGX' : CryptoFontIcons.DGX,
  'DMD' : CryptoFontIcons.DMD,
  'DOGE' : CryptoFontIcons.DOGE,
  'EMC' : CryptoFontIcons.EMC,
  'ERC' : CryptoFontIcons.ERC,
  'ETC' : CryptoFontIcons.ETC,
  'ETH' : CryptoFontIcons.ETH,
  'FCT' : CryptoFontIcons.FCT,
  'FLO' : CryptoFontIcons.FLO,
  'FRK' : CryptoFontIcons.FRK,
  'FTC' : CryptoFontIcons.FTC,
  'GAME' : CryptoFontIcons.GAME,
  'GLD' : CryptoFontIcons.GLD,
  'GNT' : CryptoFontIcons.GNT,
  'GRC' : CryptoFontIcons.GRC,
  'GRS' : CryptoFontIcons.GRS,
  'HEAT' : CryptoFontIcons.HEAT,
  'ICN' : CryptoFontIcons.ICN,
  'IFC' : CryptoFontIcons.IFC,
  'INCNT' : CryptoFontIcons.INCNT,
  'IOC' : CryptoFontIcons.IOC,
  'KMD' : CryptoFontIcons.KMD,
  'KOBO' : CryptoFontIcons.KOBO,
  'KORE' : CryptoFontIcons.KORE,
  'LBC' : CryptoFontIcons.LBC,
  'LDOGE' : CryptoFontIcons.LDOGE,
  'LSK' : CryptoFontIcons.LSK,
  'LTC' : CryptoFontIcons.LTC,
  'MAID' : CryptoFontIcons.MAID,
  'MINT' : CryptoFontIcons.MINT,
  'MONA' : CryptoFontIcons.MONA,
  'MUE' : CryptoFontIcons.MUE,
  'NEOS' : CryptoFontIcons.NEOS,
  'NLG' : CryptoFontIcons.NLG,
  'NMC' : CryptoFontIcons.NMC,
  'NOTE' : CryptoFontIcons.NOTE,
  'NUC' : CryptoFontIcons.NUC,
  'NXT' : CryptoFontIcons.NXT,
  'OK' : CryptoFontIcons.OK,
  'OMNI' : CryptoFontIcons.OMNI,
  'PINK' : CryptoFontIcons.PINK,
  'PIVX' : CryptoFontIcons.PIVX,
  'POT' : CryptoFontIcons.POT,
  'PPC' : CryptoFontIcons.PPC,
  'QRK' : CryptoFontIcons.QRK,
  'RBY' : CryptoFontIcons.RBY,
  'RDD' : CryptoFontIcons.RDD,
  'REP' : CryptoFontIcons.REP,
  'RISE' : CryptoFontIcons.RISE,
  'SJCX' : CryptoFontIcons.SJCX,
  'SLS' : CryptoFontIcons.SLS,
  'STEEM' : CryptoFontIcons.STEEM,
  'STRAT' : CryptoFontIcons.STRAT,
  'SYS' : CryptoFontIcons.SYS,
  'TRIG' : CryptoFontIcons.TRIG,
  'UBQ' : CryptoFontIcons.UBQ,
  'UNITY' : CryptoFontIcons.UNITY,
  'USDT' : CryptoFontIcons.USDT,
  'VRC' : CryptoFontIcons.VRC,
  'VTC' : CryptoFontIcons.VTC,
  'WAVES' : CryptoFontIcons.WAVES,
  'XCP' : CryptoFontIcons.XCP,
  'XEM' : CryptoFontIcons.XEM,
  'XMR' : CryptoFontIcons.XMR,
  'XRP' : CryptoFontIcons.XRP,
  'ZEC' : CryptoFontIcons.ZEC
};


class _HomeState extends State<Home> {
  int selectedIndex = 0;

  List<Moeda> _moedas = <Moeda>[];

  @override
  void initState() {
    super.initState();
    recuperaMoeda().then((value) {
      setState(() {
        for(var moeda in value) {
          _moedas.add(moeda);
        }
        print(_moedas);
      });
    });
    print(_moedas);
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      home(),
      Text("Coming Soon"),
      Text("Coming Soon"),
      profile()
    ];
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.1),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.lightBlue),
            BottomNavigationBarItem(
                icon: new Icon(Icons.account_balance_wallet),
                label: "Carteira"),
            BottomNavigationBarItem(
                icon: new Icon(Icons.explore), label: "Notícias"),
            BottomNavigationBarItem(
                icon: new Icon(Icons.person), label: "Perfil"),
          ]),
      body: widgets.elementAt(selectedIndex),
    );
  }

  Widget home() {
    return Container(
      child: Column(
        children: [
          Container(
            height: 230,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(200, 40),
                  bottomRight: Radius.elliptical(200, 40)),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "IncoBit",
                style:
                GoogleFonts.varelaRound(fontSize: 60, color: Colors.white),
              ),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(0, -45, 0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      opcoes(CryptoFontIcons.BTC, "Comprar"),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: VerticalDivider(
                          thickness: 2,
                        ),
                      ),
                      opcoes(Icons.money, "Vender")
                    ],
                  ),
                ),
              ),
            ),
          ),
          listaMoedas(validateMoedas(_moedas, 0), Colors.yellow),
          listaMoedas(validateMoedas(_moedas, 1), Colors.blue),
          listaMoedas(validateMoedas(_moedas, 2), Colors.purple),
          listaMoedas(validateMoedas(_moedas, 3), Colors.green),
          listaMoedas(validateMoedas(_moedas, 4), Colors.yellowAccent),
        ],
      ),
    );
  }
}

Widget listaMoedas(Moeda moeda, Color fundo) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(50, 20, 30, 2),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ListTile(
        tileColor: Colors.white,
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(shape: BoxShape.circle, color: fundo),
          child: Icon(cryptoIcon[moeda.logo]),
        ),
        title: Text(moeda.name),
        subtitle: Text(moeda.price),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.stacked_line_chart),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.info_outline_rounded)
          ],
        ),
      ),
    ),
  );
}

Widget opcoes(IconData data, String titulo) {
  return Expanded(child: Column(children: [Icon(data), Text(titulo)]));
}

validateMoedas(List<Moeda> moedas, int index) {

  Moeda validatedMoeda = new Moeda("XXX", "-", index.toString(), "n sei");

  if(moedas.isEmpty || moedas[index] == null) return validatedMoeda;

  Moeda moeda = moedas[index];

  validatedMoeda.name = moeda.name;
  validatedMoeda.price = moeda.price.substring(0, 7);
  validatedMoeda.rank = moeda.rank;
  validatedMoeda.logo = moeda.logo;

  return validatedMoeda;

}

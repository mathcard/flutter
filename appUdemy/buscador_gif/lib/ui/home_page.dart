import 'dart:convert';
import 'package:buscador_gif/ui/gif_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//
  String _search;
  int _offset = 0;

 Future<Map>_getGifs() async{
    http.Response response;
    if(_search == null || _search.isEmpty)
      response = await http.get("https://api.giphy.com/v1/gifs/trending?api_key=EuVwrmMtfjo2tccsqFVYduquIpDImJQ4&limit=20&rating=G");
    else
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=EuVwrmMtfjo2tccsqFVYduquIpDImJQ4&q=$_search&limit=19&offset=$_offset&rating=G&lang=en");      
    return json.decode(response.body);
  }

  @override
  void initState(){
    super.initState();
    _getGifs().then((map){      
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network("https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: "Pesquise aqui!",
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(color: Colors.white, fontSize: 18.0),
            textAlign: TextAlign.center,
            onSubmitted: (text){ //Executa função quando é confirmado
              setState(() {
                _search = text;  
              });              
            } ,
          ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _getGifs(),
              builder: (context, snapshot){
                switch(snapshot.connectionState){
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                      return Container(
                        width: 200.0,
                        height: 200.0,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 5.0,
                        ),
                      );
                      default:
                      if(snapshot.hasError) return Container();
                     // else return Container(color: Colors.white,);
                       else return _createGifTable(context, snapshot);
                }
              }
            ),
          ),
        ],
      ),
    );
  }

  int _getCount(List data){
    if(_search == null){
      return data.length;
    }else{
      return data.length + 1;
    }
  }

  Widget _createGifTable(BuildContext context, AsyncSnapshot snapshot){
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // QTD itens na horizontal
        crossAxisSpacing: 10.0, // Espacamento na horizontal
        mainAxisSpacing: 10.0,
      ),
      itemCount: _getCount(snapshot.data["data"]), // QTD Total de itens
      itemBuilder: (context, index){ // Passa um index, e paga uma info
        // if consulta padrão, traz os gifs, else consulta com pesquisa e for ultimo item, traz o botão add
        if(_search == null || index < snapshot.data["data"].length)
        return GestureDetector( //Permite clicar na imagem
          child: FadeInImage.memoryNetwork(  // Melhorando a visualização das imagens
            placeholder: kTransparentImage, // Imagem transparente do flutter, importa no pubspec.yaml e na linha 6
            image: snapshot.data["data"][index]["images"]["fixed_height"]["url"],
            height: 300.0,
            fit: BoxFit.cover,
          ),                    
          onTap:(){
            // Redireciona pra outra página
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => GifPage(snapshot.data["data"][index])));
          },
          onLongPress: (){
            Share.share(snapshot.data["data"][index]["images"]["fixed_height"]["url"]);
          },
        );
        else
            return Container(
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add, color: Colors.white, size: 70.0,),
                    Text("Carregar mais...", style: TextStyle(color: Colors.white, fontSize: 22.0),),                    
                  ],
                ),
                onTap: (){ // Ao tocar no icon carrega + 19 itens
                  setState(() {
                   _offset +=19; 
                  });
                },
              ),
            );
      },
    );
  }

}
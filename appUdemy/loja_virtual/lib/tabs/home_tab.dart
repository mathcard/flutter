import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient( // Criando efeito degradê
          colors: [
            Color.fromARGB(255, 211, 118, 130),
            Color.fromARGB(255, 253, 181, 168)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),
      ),
    );
    
//return Container(color: Colors.redAccent,);
    return Stack( //Conteúdo acima do fundo
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(  
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,  // Ao puxar pra baixo a barra some
              backgroundColor: Colors.transparent, // Vai ficar com a cor do container
              elevation: 0.0, // Não deixa sombras
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Novidades"),
                centerTitle: true,
              ),
            ),
           FutureBuilder<QuerySnapshot>(
              future: Firestore.instance.collection("home").orderBy("pos").getDocuments(),
              builder: (context, snapshot){
                if(!snapshot.hasData){                  
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),    
                  );
                }                
                else{
                  print(snapshot.data.documents.length);                  
                  return SliverStaggeredGrid.count(
                    crossAxisCount: 2, //QTD horizontal
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    staggeredTiles: snapshot.data.documents.map( //Buscando as dimensões no banco
                      (doc){  // Funçao anonima recebe os documentos
                        return StaggeredTile.count(doc.data["x"], doc.data["y"]);
                      }
                    ).toList(), // Transforma os documentos do staggeredTile e lista
                    children: snapshot.data.documents.map( // definindo as imagens
                      (doc){
                        return FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: doc.data["image"],
                          fit: BoxFit.cover,
                        );
                      }
                    ).toList(),
                  );
                }
              },
            ), 
          ],
        ),
      ],
    );      
  }
}

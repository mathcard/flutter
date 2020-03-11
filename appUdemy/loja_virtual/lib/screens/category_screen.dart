import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/datas/product_data.dart';
import 'package:loja_virtual/tiles/product_tile.dart';

class CategoryScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;
  CategoryScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController( //Efeito para as tabs
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(snapshot.data["title"]),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.list))
            ],
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance.collection("products").document(snapshot.documentID)
            .collection("itens").getDocuments(),
          builder: (context, snapshot){
            if(!snapshot.hasData)
              return Center(child: CircularProgressIndicator(),);
            else
              return TabBarView(
                physics: NeverScrollableScrollPhysics(), // Não permite arrastar com deslizar do dedo
                children: [
                  GridView.builder(  // builder não deixa carregar tudo de uma vez
                    padding: EdgeInsets.all(4.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Cross - Horizontal se a lista for vertical, vice-versa
                      mainAxisSpacing: 4, // Espaçamento
                      crossAxisSpacing: 4, // Espaçamento cruzado
                      childAspectRatio: 0.65,                      
                    ),
                    itemCount: snapshot.data.documents.length, // Quantidade de itens
                    itemBuilder: (context, index) { // Recebe a lista de documentos pelo index, transforma em objeto ProductData, passa ao Product Tile                                            
                      return ProductTile("grid", ProductData.fromDocument(snapshot.data.documents[index])); // Motivo: if change BD, basta modificar p ProductData                      
                    },
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(4.0),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) { 
                      return ProductTile("list", ProductData.fromDocument(snapshot.data.documents[index])); 
                    },
                  ),
                ],
              );
            },          
        )
      ),
    );
  }
}
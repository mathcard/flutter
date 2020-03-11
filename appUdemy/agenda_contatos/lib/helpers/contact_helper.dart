import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Declarando as colunas
final String contactTable = "contactTable"; // Nome da tabela
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String emailColumn = "emailColumn";
final String phoneColumn = "phoneColumn";
final String imgColumn = "imgColumn";


class ContactHelper{ // Classe existe apenas um objeto
  // static - Variavel apenas da classe e não do objeto
  // Cria um objeto dentro da propria classe: _instance; Construtor interno: ContactHelper.internal();
  static final ContactHelper _instance = ContactHelper.internal();
  
  factory ContactHelper() => _instance;

  ContactHelper.internal();

  Database _db; //Declarando o banco de dados

  // Iniciando DB
  Future<Database> get db async{
    if(_db != null){
      return _db;
    }else{
      _db = await initDb();
      return _db;
    }
  }

  // Função que criar o banco de dados
  Future<Database>initDb() async {
    final databasesPath = await getDatabasesPath();   //Local onde o banco é armazenado
    final path = join(databasesPath, "contactsNew.db"); // Pasando o caminho/nome do banco   
    
    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async{
      await db.execute( 
        // Criando a tabela
        "CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $emailColumn TEXT, $phoneColumn TEXT, $imgColumn TEXT)"
      );
    });
  }

  // Insert
  Future<Contact> saveContact(Contact contact) async{
    Database dbContact = await db; // Obtendo banco
    contact.id = await dbContact.insert(contactTable, contact.toMap()); // Retornando o id co contato e inserindo
    return contact;
  }

  // Consultando dados
  Future<Contact> getContact(int id) async{
    Database dbContact = await db; // Obtendo banco
    List<Map> maps = await dbContact.query(contactTable,
    columns: [nameColumn, emailColumn, phoneColumn, imgColumn],
    where: "$idColumn = ?", 
    whereArgs: [id]);
    // Validando se o contado foi selecionado
    if(maps.length > 0){
      return Contact.fromMap(maps.first);
    }else{
      return null;
    }
  }

  // Delete
  Future<int>  deleteContact(int id) async{
    Database dbContact = await db; // Obtendo banco
    return await dbContact.delete(contactTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int>updateContact(Contact contact)async{
    Database dbContact = await db;
    return await dbContact.update(contactTable,
     contact.toMap(), 
     where: "$idColumn = ?", 
     whereArgs: [contact.id]);
  }

  getAllContacts()async{
    Database dbContact = await db;
    List listMap = await dbContact.rawQuery("Select * from $contactTable");    
    // listMap precisando ser transformado em contato
    List<Contact> listContact = List();    
    for(Map m in listMap){
      listContact.add(Contact.fromMap(m));
    }
    return listContact;
  }

//QTD Contatos
  Future<int>  getNumbe()async {
    Database dbContact = await db;
    return Sqflite.firstIntValue(await dbContact.rawQuery(
      "Select count(*) from $contactTable"));
  }

  Future close() async{
    Database dbContact = await db;
    dbContact.close();
  }

}

// Declarando variaveis
class Contact{
  int id;
  String name;
  String email;
  String phone;
  String img;
  Contact();
  //Construtor - de Map para Contacto
  Contact.fromMap(Map map){
    id = map[idColumn];
    name = map[nameColumn];
    email = map[emailColumn];
    phone = map[phoneColumn];
    img = map[imgColumn];
  }

  // de Contacto para Map
  Map toMap(){
    Map<String, dynamic> map = {
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
      imgColumn: img
    }; // id é fornecido pelo banco de dados
    if(id != null){
      map[idColumn] = id;
    }
    return map;
  }
  

  // "Ler os dados de uma forma legal"
  @override
  String toString() {
    return "Contact(id: $id, name:$name, email:$email, phone:$phone, img:$img)";
  }
}
import 'package:app1/bloc/contactos_bloc.dart';
import 'package:app1/models/contacto_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final contactosBloc = ContactosBloc();
  @override
  Widget build(BuildContext context) {
    contactosBloc.cargaContactos();
    return Scaffold(
      appBar: AppBar(
        title: Text("Contactos"),
      ),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        onPressed: () => Navigator.pushNamed(context, 'registro'),
      ),
    );
  }

  _buildList() {
    return StreamBuilder(
      stream: contactosBloc.contactosStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<ContactoModel>> snapshot) {
        if (snapshot.hasData) {
          final contactos = snapshot.data;
          return ListView.builder(
            itemCount: contactos.length,
            itemBuilder: (context, i) {
              return _buildItemList(context, contactos[i]);
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  _buildItemList(BuildContext context, ContactoModel model) {
    var color = Colors.red;

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: color,
      ),
      onDismissed: (direction) {
        contactosBloc.deleteContacto(model);
      },
      child: ExpansionTile(
        title: Text(model.nombre),
        leading: Icon(Icons.person),
        trailing: IconButton(
          icon: Icon(
            Icons.edit,
            color: Colors.purple,
          ),
          onPressed: () =>
              Navigator.pushNamed(context, 'registro', arguments: model),
        ),
        children: <Widget>[
          ListTile(
            title: Text(model.correo),
            subtitle: Text("Correo"),
            leading: Icon(Icons.email),
          ),
          ListTile(
            title: Text(model.ocupacion),
            subtitle: Text("Ocupación"),
            leading: Icon(Icons.work),
          ),
          ListTile(
            title: Text(model.telefono),
            subtitle: Text("Telefono"),
            leading: Icon(Icons.phone),
            trailing: MaterialButton(
              child: Text("Llamar"),
              onPressed: ()=>makeCall("tel:${model.telefono}"),
            )
          ),
        ],
      ),
    );
  }
}
Future<void> makeCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

/*


ListTile(
        title: Text(model.nombre), 
        subtitle: Text(model.ocupacion),
        onTap: ()=>Navigator.pushNamed(context, 'registro',arguments: model),
      ) 


*/

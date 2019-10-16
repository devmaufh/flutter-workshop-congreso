import 'package:flutter/material.dart';
import 'package:nasa_picks/bloc/fotos_bloc.dart';
import 'package:nasa_picks/models/foto_model.dart';
import 'package:nasa_picks/providers/fotos_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FotosBloc bloc = FotosBloc();
  @override
  Widget build(BuildContext context) {
    bloc.getFotos();
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.purpleAccent,
        primaryColorDark: Colors.purple,
        iconTheme: IconThemeData(
          color: Colors.purple
        )
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: Container(
            child: _buildList(),
          )),
    );
  }

  Widget _buildList() {
    return StreamBuilder(
      stream: bloc.fotosStream,
      builder: (BuildContext context, AsyncSnapshot<List<Foto>> snapshot) {
        if (snapshot.hasData) {
          print("SI hay data");
          final fotos = snapshot.data;
          return ListView.builder(
              itemCount: fotos.length,
              itemBuilder: (BuildContext context, i) {
                return _buildItemFoto(fotos[i]);
              });
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  _buildItemFoto(Foto fotoModel) {
    return ExpansionTile(
      leading: Icon(Icons.date_range),
      title: Text(fotoModel.earthDate.toIso8601String()),
      children: <Widget>[
        ListTile(leading: Icon(Icons.train),title: Text(fotoModel.rover.name),subtitle: Text("Rover")),
        ListTile(leading:Icon(Icons.camera) ,title: Text(fotoModel.camera.fullName),),
        FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(fotoModel.imgSrc),
        )
      ],
    );
  }
}

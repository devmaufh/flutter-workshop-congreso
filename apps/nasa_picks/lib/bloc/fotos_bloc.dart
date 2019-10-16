import 'dart:async';
import 'dart:io';
import 'package:nasa_picks/models/foto_model.dart';
import 'package:nasa_picks/providers/fotos_provider.dart';

class FotosBloc{
  final _fotosController = StreamController<List<Foto>>.broadcast();
  final _fotosProvider = FotosProvider();
  Stream<List<Foto>> get fotosStream => _fotosController.stream;

  void getFotos()async{
    var fotos  = await _fotosProvider.getPhotos(); 
    if(fotos!=false){
      _fotosController.sink.add(fotos);
    }else{
      print("No hay datos");
    }
  }
}
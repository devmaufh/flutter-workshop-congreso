import 'package:nasa_picks/models/foto_model.dart';
import 'package:quiver/async.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FotosProvider {
  final String END_POINT ="https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=9YUjcWGektOEtjiwK1QlXAMbNsg3aKdSaDdO6v73";

  getPhotos()async{
    var request = await http.get(END_POINT);
    if( request.statusCode == 200|| request.statusCode ==201 ){
      var response = json.decode(request.body);
      List<Foto> fotos = (response['photos'] as List).map((foto) => Foto.fromJson(foto)).toList();
      
      List<Foto> fotos10 = List<Foto>();
      for(int i = 0; i<=10; i++){
        fotos10.add(fotos[i]);
      }
      return fotos;
    }else{
      print("Error");
      return false;
    }
  }

}
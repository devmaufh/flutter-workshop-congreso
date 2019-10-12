void main(){
  var lista = [1,2,3,4,5,3,1,3,5,6,20,2];
  var aux = 0;
  
  lista.forEach((item){
    if(item>aux) aux = item;
  });
  
  print(aux);
}
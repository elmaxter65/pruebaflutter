import 'package:firebase_database/firebase_database.dart';

class Caopermissao {
  String co_sistema;
  String co_tipo_usuario;
  String co_usuario;
  String co_usuario_atualizacao;
  String dt_atualizacao;
  String in_ativo;


  Caopermissao(this.co_sistema, this.co_tipo_usuario, this.co_usuario,
      this.co_usuario_atualizacao, this.dt_atualizacao, this.in_ativo);

  Caopermissao.fromSnapshot(DataSnapshot snapshot) {

    co_sistema = snapshot.value['co_sistema'];
    co_tipo_usuario = snapshot.value['co_tipo_usuario'];
    co_usuario = snapshot.value['co_usuario'];
    co_usuario_atualizacao = snapshot.value['co_usuario_atualizacao'];
    dt_atualizacao = snapshot.value['dt_atualizacao'];
    in_ativo = snapshot.value['in_ativo'];


  }
}

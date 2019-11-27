import 'package:firebase_database/firebase_database.dart';

class Caousuario {

  String co_usuario;

  String co_usuario_autorizacao;

  String ds_bairro;

  String ds_comp_end;

  String ds_endereco;

  String ds_senha;

  String dt_admissao_empresa;

  String dt_alteracao;

  String dt_desligamento;

  String dt_expedicao;

  String dt_expiracao;

  String dt_inclusao;

  String dt_nascimento;

  String icq;

  String instant_messenger;

  String msn;

  String no_cidade;

  String no_email;

  String no_email_pessoal;

  String no_orgao_emissor;

  String no_usuario;

  String nu_cep;

  String nu_cpf;

  String nu_matricula;

  String nu_rg;

  String nu_telefone;

  String uf_cidade;

  String uf_orgao_emissor;

  String url_foto;

  String yms;




  Caousuario(this.co_usuario, this.co_usuario_autorizacao, this.ds_bairro,
      this.ds_comp_end, this.ds_endereco, this.ds_senha,
      this.dt_admissao_empresa, this.dt_alteracao, this.dt_desligamento,
      this.dt_expedicao, this.dt_expiracao, this.dt_inclusao,
      this.dt_nascimento, this.icq, this.instant_messenger, this.msn,
      this.no_cidade, this.no_email, this.no_email_pessoal,
      this.no_orgao_emissor, this.no_usuario, this.nu_cep, this.nu_cpf,
      this.nu_matricula, this.nu_rg, this.nu_telefone, this.uf_cidade,
      this.uf_orgao_emissor, this.url_foto, this.yms);






  Caousuario.fromSnapshot(DataSnapshot snapshot) {

     co_usuario= snapshot.value['co_usuario'];

     co_usuario_autorizacao= snapshot.value['co_usuario_autorizacao'];

     ds_bairro= snapshot.value['ds_bairro'];

     ds_comp_end= snapshot.value['ds_comp_end'];

     ds_endereco= snapshot.value['ds_endereco'];

     ds_senha= snapshot.value['ds_senha'];

     dt_admissao_empresa= snapshot.value['dt_admissao_empresa'];

     dt_alteracao= snapshot.value['dt_alteracao'];

     dt_desligamento= snapshot.value['dt_desligamento'];

     dt_expedicao= snapshot.value['dt_expedicao'];

     dt_expiracao= snapshot.value['dt_expiracao'];

     dt_inclusao= snapshot.value['dt_inclusao'];

     dt_nascimento= snapshot.value['dt_nascimento'];

     icq= snapshot.value['icq'];

     instant_messenger= snapshot.value['instant_messenger'];

     msn= snapshot.value['msn'];

     no_cidade= snapshot.value['no_cidade'];

     no_email= snapshot.value['no_email'];

     no_email_pessoal= snapshot.value['no_email_pessoal'];

     no_orgao_emissor= snapshot.value['no_orgao_emissor'];

     no_usuario= snapshot.value['no_usuario'];

     nu_cep= snapshot.value['nu_cep'];

     nu_cpf= snapshot.value['nu_cpf'];

     nu_matricula= snapshot.value['nu_matricula'];

     nu_rg= snapshot.value['nu_rg'];

     nu_telefone= snapshot.value['nu_telefone'];

     uf_cidade= snapshot.value['uf_cidade'];

     uf_orgao_emissor= snapshot.value['uf_orgao_emissor'];

     url_foto= snapshot.value['url_foto'];

    yms= snapshot.value['yms'];
  }
}

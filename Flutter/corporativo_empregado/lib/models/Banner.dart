class BannerFuncef {
  String _id;
  String _nome;
  String _url;
  String _imagem;

//Banner(this._id,this._nome,this._url,this._imagem);

  String get id => _id;
  String get nome => _nome;
  String get url => _url;
  String get imagem => _imagem;

  set id(String value) {
    _id = value;
  }

  set nome(String value) {
    _nome = value;
  }

  set imagem(String value) {
    _imagem = value;
  }

  set url(String value) {
    _url = value;
  }
}

class Chamado {
  String _id;
  String _chamado_interno;
  String _chamado_si;
  String _data;
  String _hora;
  String _numeroloja;
  String _problema;
  String _quemabriu;
  String _status;

  Chamado(this._id, this._chamado_interno, this._chamado_si,this._data,this._hora,this._numeroloja,this._problema,this._quemabriu,this._status);

  Chamado.map(dynamic obj) {
    this._id = obj['id'];
    this._chamado_interno = obj['chamado_interno'];
    this._chamado_si = obj['chamado_si'];
    this._data = obj['data'];
    this._hora = obj['hora'];
    this._numeroloja = obj['numeroloja'];
    this._problema = obj['problema'];
    this._quemabriu = obj['quemabriu'];
    this._status = obj['status'];
  }

  String get id => _id;
  String get chamado_interno => _chamado_interno;
  String get chamado_si => _chamado_si;
  String get data => _data;
  String get hora => _hora;
  String get numeroloja => _numeroloja;
  String get problema => _problema;
  String get quemabriu => _quemabriu;
  String get status => _status;


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['chamado_interno'] = _chamado_interno;
    map['chamado_si'] = _chamado_si;
    map['data'] = _data;
    map['hora'] = _hora;
    map['numeroloja'] = _numeroloja;
    map['problema'] = _problema;
    map['quemabriu'] = _quemabriu;
    map['status'] = _status;

    return map;
  }

}
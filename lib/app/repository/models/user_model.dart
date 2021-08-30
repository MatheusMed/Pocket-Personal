import 'dart:convert';

class UserModel {
  final int? id;
  final String? nome;
  final int? peso;
  final int? altura;
  final double? resultado;

  UserModel({
    this.id,
    this.nome,
    this.peso,
    this.altura,
    this.resultado,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'peso': peso,
      'altura': altura,
      'resultado': resultado,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      nome: map['nome'],
      peso: map['peso'],
      altura: map['altura'],
      resultado: map['resultado'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, nome: $nome, peso: $peso, altura: $altura, resultado: $resultado)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.nome == nome &&
        other.peso == peso &&
        other.altura == altura &&
        other.resultado == resultado;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        peso.hashCode ^
        altura.hashCode ^
        resultado.hashCode;
  }

  UserModel copyWith({
    int? id,
    String? nome,
    int? peso,
    int? altura,
    double? resultado,
  }) {
    return UserModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      peso: peso ?? this.peso,
      altura: altura ?? this.altura,
      resultado: resultado ?? this.resultado,
    );
  }
}

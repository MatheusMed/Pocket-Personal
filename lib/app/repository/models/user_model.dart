import 'dart:convert';

class UserModel {
  final int? id;
  final String? nome;
  final String? peso;
  final String? altura;

  UserModel({
    this.id,
    this.nome,
    this.peso,
    this.altura,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'peso': peso,
      'altura': altura,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      nome: map['nome'],
      peso: map['peso'],
      altura: map['altura'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, nome: $nome, peso: $peso, altura: $altura)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.nome == nome &&
        other.peso == peso &&
        other.altura == altura;
  }

  @override
  int get hashCode {
    return id.hashCode ^ nome.hashCode ^ peso.hashCode ^ altura.hashCode;
  }

  UserModel copyWith({
    int? id,
    String? nome,
    String? peso,
    String? altura,
  }) {
    return UserModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      peso: peso ?? this.peso,
      altura: altura ?? this.altura,
    );
  }
}

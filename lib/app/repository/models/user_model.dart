import 'dart:convert';

class UserModel {
  final String? nome;
  final double? peso;
  final double? altura;

  UserModel(
    this.nome,
    this.peso,
    this.altura,
  );

  UserModel copyWith({
    String? nome,
    double? peso,
    double? altura,
  }) {
    return UserModel(
      nome ?? this.nome,
      peso ?? this.peso,
      altura ?? this.altura,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'peso': peso,
      'altura': altura,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['nome'],
      map['peso'],
      map['altura'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(nome: $nome, peso: $peso, altura: $altura)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.nome == nome &&
        other.peso == peso &&
        other.altura == altura;
  }

  @override
  int get hashCode => nome.hashCode ^ peso.hashCode ^ altura.hashCode;
}

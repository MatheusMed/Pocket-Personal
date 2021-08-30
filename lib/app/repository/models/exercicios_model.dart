import 'dart:convert';

class ExerciciosModel {
  final String? titulo;
  final String? execusao;
  final String? prevDescricao;
  final String? imagem;

  ExerciciosModel({
    this.titulo,
    this.execusao,
    this.prevDescricao,
    this.imagem,
  });

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'execusao': execusao,
      'prevDescricao': prevDescricao,
      'imagem': imagem,
    };
  }

  factory ExerciciosModel.fromMap(Map<String, dynamic> map) {
    return ExerciciosModel(
      titulo: map['titulo'],
      execusao: map['execusao'],
      prevDescricao: map['prevDescricao'],
      imagem: map['imagem'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciciosModel.fromJson(String source) =>
      ExerciciosModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExerciciosModel(titulo: $titulo, execusao: $execusao, prevDescricao: $prevDescricao, imagem: $imagem)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExerciciosModel &&
        other.titulo == titulo &&
        other.execusao == execusao &&
        other.prevDescricao == prevDescricao &&
        other.imagem == imagem;
  }

  @override
  int get hashCode {
    return titulo.hashCode ^
        execusao.hashCode ^
        prevDescricao.hashCode ^
        imagem.hashCode;
  }

  ExerciciosModel copyWith({
    String? titulo,
    String? execusao,
    String? prevDescricao,
    String? imagem,
  }) {
    return ExerciciosModel(
      titulo: titulo ?? this.titulo,
      execusao: execusao ?? this.execusao,
      prevDescricao: prevDescricao ?? this.prevDescricao,
      imagem: imagem ?? this.imagem,
    );
  }
}

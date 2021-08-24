import 'dart:convert';

class ExerciciosModel {
  final String? titulo;
  final String? execusao;
  final String? prevDescricao;

  ExerciciosModel({
    this.titulo,
    this.execusao,
    this.prevDescricao,
  });

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'execusao': execusao,
      'prevDescricao': prevDescricao,
    };
  }

  factory ExerciciosModel.fromMap(Map<String, dynamic> map) {
    return ExerciciosModel(
      titulo: map['titulo'],
      execusao: map['execusao'],
      prevDescricao: map['prevDescricao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciciosModel.fromJson(String source) =>
      ExerciciosModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ExerciciosModel(titulo: $titulo, execusao: $execusao, prevDescricao: $prevDescricao)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExerciciosModel &&
        other.titulo == titulo &&
        other.execusao == execusao &&
        other.prevDescricao == prevDescricao;
  }

  @override
  int get hashCode =>
      titulo.hashCode ^ execusao.hashCode ^ prevDescricao.hashCode;

  ExerciciosModel copyWith({
    String? titulo,
    String? execusao,
    String? prevDescricao,
  }) {
    return ExerciciosModel(
      titulo: titulo ?? this.titulo,
      execusao: execusao ?? this.execusao,
      prevDescricao: prevDescricao ?? this.prevDescricao,
    );
  }
}

import 'dart:convert';

class ExerciciosCustom {
  final int? id;
  final String? titulo;
  final String? execusao;
  final String? prevDescricao;
  ExerciciosCustom({
    this.id,
    this.titulo,
    this.execusao,
    this.prevDescricao,
  });

  ExerciciosCustom copyWith({
    int? id,
    String? titulo,
    String? execusao,
    String? prevDescricao,
  }) {
    return ExerciciosCustom(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      execusao: execusao ?? this.execusao,
      prevDescricao: prevDescricao ?? this.prevDescricao,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'execusao': execusao,
      'prevDescricao': prevDescricao,
    };
  }

  factory ExerciciosCustom.fromMap(Map<String, dynamic> map) {
    return ExerciciosCustom(
      id: map['id'],
      titulo: map['titulo'],
      execusao: map['execusao'],
      prevDescricao: map['prevDescricao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciciosCustom.fromJson(String source) =>
      ExerciciosCustom.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExerciciosCustom(id: $id, titulo: $titulo, execusao: $execusao, prevDescricao: $prevDescricao)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExerciciosCustom &&
        other.id == id &&
        other.titulo == titulo &&
        other.execusao == execusao &&
        other.prevDescricao == prevDescricao;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        titulo.hashCode ^
        execusao.hashCode ^
        prevDescricao.hashCode;
  }
}

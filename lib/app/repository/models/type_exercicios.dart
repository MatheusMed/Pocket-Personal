import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'exercicios_model.dart';

class TypeExercicios {
  final String? tipo;
  final List<ExerciciosModel?>? listaExercicios;
  TypeExercicios({
    this.tipo,
    this.listaExercicios,
  });

  TypeExercicios copyWith({
    String? tipo,
    List<ExerciciosModel?>? listaExercicios,
  }) {
    return TypeExercicios(
      tipo: tipo ?? this.tipo,
      listaExercicios: listaExercicios ?? this.listaExercicios,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tipo': tipo,
      'listaExercicios': listaExercicios?.map((x) => x?.toMap()).toList(),
    };
  }

  factory TypeExercicios.fromMap(Map<String, dynamic> map) {
    return TypeExercicios(
      tipo: map['tipo'],
      listaExercicios: List<ExerciciosModel?>.from(
          map['listaExercicios']?.map((x) => ExerciciosModel?.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeExercicios.fromJson(String source) =>
      TypeExercicios.fromMap(json.decode(source));

  @override
  String toString() =>
      'TypeExercicios(tipo: $tipo, listaExercicios: $listaExercicios)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TypeExercicios &&
        other.tipo == tipo &&
        listEquals(other.listaExercicios, listaExercicios);
  }

  @override
  int get hashCode => tipo.hashCode ^ listaExercicios.hashCode;
}

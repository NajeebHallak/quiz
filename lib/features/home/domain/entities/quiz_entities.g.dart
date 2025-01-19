// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_entities.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuizEntitiesAdapter extends TypeAdapter<QuizEntities> {
  @override
  final int typeId = 1;

  @override
  QuizEntities read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuizEntities(
      category: fields[0] as String,
      question: fields[1] as String,
      correctAnswer: fields[2] as String,
      incorrectAnswers: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuizEntities obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.correctAnswer)
      ..writeByte(3)
      ..write(obj.incorrectAnswers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizEntitiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

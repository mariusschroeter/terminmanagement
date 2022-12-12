import 'dart:async';

import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'termine_record.g.dart';

abstract class TermineRecord
    implements Built<TermineRecord, TermineRecordBuilder> {
  static Serializer<TermineRecord> get serializer => _$termineRecordSerializer;

  String? get status;

  String? get comment;

  DateTime? get date;

  String? get company;

  String? get address;

  String? get contact;

  int? get duration;

  String? get statusComment;

  bool? get isDone;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TermineRecordBuilder builder) => builder
    ..status = ''
    ..comment = ''
    ..company = ''
    ..address = ''
    ..contact = ''
    ..duration = 0
    ..statusComment = ''
    ..isDone = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('termine');

  static Stream<TermineRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TermineRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TermineRecord._();
  factory TermineRecord([void Function(TermineRecordBuilder) updates]) =
      _$TermineRecord;

  static TermineRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTermineRecordData({
  String? status,
  String? comment,
  DateTime? date,
  String? company,
  String? address,
  String? contact,
  int? duration,
  String? statusComment,
  bool? isDone,
}) {
  final firestoreData = serializers.toFirestore(
    TermineRecord.serializer,
    TermineRecord(
      (t) => t
        ..status = status
        ..comment = comment
        ..date = date
        ..company = company
        ..address = address
        ..contact = contact
        ..duration = duration
        ..statusComment = statusComment
        ..isDone = isDone,
    ),
  );

  return firestoreData;
}

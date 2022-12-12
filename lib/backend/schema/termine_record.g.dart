// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'termine_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TermineRecord> _$termineRecordSerializer =
    new _$TermineRecordSerializer();

class _$TermineRecordSerializer implements StructuredSerializer<TermineRecord> {
  @override
  final Iterable<Type> types = const [TermineRecord, _$TermineRecord];
  @override
  final String wireName = 'TermineRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TermineRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.company;
    if (value != null) {
      result
        ..add('company')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contact;
    if (value != null) {
      result
        ..add('contact')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.duration;
    if (value != null) {
      result
        ..add('duration')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.statusComment;
    if (value != null) {
      result
        ..add('statusComment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isDone;
    if (value != null) {
      result
        ..add('isDone')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  TermineRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TermineRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'company':
          result.company = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'contact':
          result.contact = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'statusComment':
          result.statusComment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isDone':
          result.isDone = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$TermineRecord extends TermineRecord {
  @override
  final String? status;
  @override
  final String? comment;
  @override
  final DateTime? date;
  @override
  final String? company;
  @override
  final String? address;
  @override
  final String? contact;
  @override
  final int? duration;
  @override
  final String? statusComment;
  @override
  final bool? isDone;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TermineRecord([void Function(TermineRecordBuilder)? updates]) =>
      (new TermineRecordBuilder()..update(updates))._build();

  _$TermineRecord._(
      {this.status,
      this.comment,
      this.date,
      this.company,
      this.address,
      this.contact,
      this.duration,
      this.statusComment,
      this.isDone,
      this.ffRef})
      : super._();

  @override
  TermineRecord rebuild(void Function(TermineRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TermineRecordBuilder toBuilder() => new TermineRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TermineRecord &&
        status == other.status &&
        comment == other.comment &&
        date == other.date &&
        company == other.company &&
        address == other.address &&
        contact == other.contact &&
        duration == other.duration &&
        statusComment == other.statusComment &&
        isDone == other.isDone &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, status.hashCode),
                                        comment.hashCode),
                                    date.hashCode),
                                company.hashCode),
                            address.hashCode),
                        contact.hashCode),
                    duration.hashCode),
                statusComment.hashCode),
            isDone.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TermineRecord')
          ..add('status', status)
          ..add('comment', comment)
          ..add('date', date)
          ..add('company', company)
          ..add('address', address)
          ..add('contact', contact)
          ..add('duration', duration)
          ..add('statusComment', statusComment)
          ..add('isDone', isDone)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TermineRecordBuilder
    implements Builder<TermineRecord, TermineRecordBuilder> {
  _$TermineRecord? _$v;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  String? _company;
  String? get company => _$this._company;
  set company(String? company) => _$this._company = company;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _contact;
  String? get contact => _$this._contact;
  set contact(String? contact) => _$this._contact = contact;

  int? _duration;
  int? get duration => _$this._duration;
  set duration(int? duration) => _$this._duration = duration;

  String? _statusComment;
  String? get statusComment => _$this._statusComment;
  set statusComment(String? statusComment) =>
      _$this._statusComment = statusComment;

  bool? _isDone;
  bool? get isDone => _$this._isDone;
  set isDone(bool? isDone) => _$this._isDone = isDone;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TermineRecordBuilder() {
    TermineRecord._initializeBuilder(this);
  }

  TermineRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _comment = $v.comment;
      _date = $v.date;
      _company = $v.company;
      _address = $v.address;
      _contact = $v.contact;
      _duration = $v.duration;
      _statusComment = $v.statusComment;
      _isDone = $v.isDone;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TermineRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TermineRecord;
  }

  @override
  void update(void Function(TermineRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TermineRecord build() => _build();

  _$TermineRecord _build() {
    final _$result = _$v ??
        new _$TermineRecord._(
            status: status,
            comment: comment,
            date: date,
            company: company,
            address: address,
            contact: contact,
            duration: duration,
            statusComment: statusComment,
            isDone: isDone,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

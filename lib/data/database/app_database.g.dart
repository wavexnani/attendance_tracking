// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TimetableVersionsTable extends TimetableVersions
    with TableInfo<$TimetableVersionsTable, TimetableVersion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimetableVersionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [id, createdAt, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'timetable_versions';
  @override
  VerificationContext validateIntegrity(
    Insertable<TimetableVersion> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TimetableVersion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimetableVersion(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $TimetableVersionsTable createAlias(String alias) {
    return $TimetableVersionsTable(attachedDatabase, alias);
  }
}

class TimetableVersion extends DataClass
    implements Insertable<TimetableVersion> {
  final int id;
  final DateTime createdAt;
  final bool isActive;
  const TimetableVersion({
    required this.id,
    required this.createdAt,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  TimetableVersionsCompanion toCompanion(bool nullToAbsent) {
    return TimetableVersionsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      isActive: Value(isActive),
    );
  }

  factory TimetableVersion.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimetableVersion(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  TimetableVersion copyWith({int? id, DateTime? createdAt, bool? isActive}) =>
      TimetableVersion(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        isActive: isActive ?? this.isActive,
      );
  TimetableVersion copyWithCompanion(TimetableVersionsCompanion data) {
    return TimetableVersion(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TimetableVersion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimetableVersion &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.isActive == this.isActive);
}

class TimetableVersionsCompanion extends UpdateCompanion<TimetableVersion> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<bool> isActive;
  const TimetableVersionsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  TimetableVersionsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime createdAt,
    this.isActive = const Value.absent(),
  }) : createdAt = Value(createdAt);
  static Insertable<TimetableVersion> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (isActive != null) 'is_active': isActive,
    });
  }

  TimetableVersionsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
    Value<bool>? isActive,
  }) {
    return TimetableVersionsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimetableVersionsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $TimetableSlotsTable extends TimetableSlots
    with TableInfo<$TimetableSlotsTable, TimetableSlot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimetableSlotsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _timetableVersionIdMeta =
      const VerificationMeta('timetableVersionId');
  @override
  late final GeneratedColumn<int> timetableVersionId = GeneratedColumn<int>(
    'timetable_version_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES timetable_versions (id)',
    ),
  );
  static const VerificationMeta _subjectNameMeta = const VerificationMeta(
    'subjectName',
  );
  @override
  late final GeneratedColumn<String> subjectName = GeneratedColumn<String>(
    'subject_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayOfWeekMeta = const VerificationMeta(
    'dayOfWeek',
  );
  @override
  late final GeneratedColumn<int> dayOfWeek = GeneratedColumn<int>(
    'day_of_week',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startMinutesMeta = const VerificationMeta(
    'startMinutes',
  );
  @override
  late final GeneratedColumn<int> startMinutes = GeneratedColumn<int>(
    'start_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endMinutesMeta = const VerificationMeta(
    'endMinutes',
  );
  @override
  late final GeneratedColumn<int> endMinutes = GeneratedColumn<int>(
    'end_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    timetableVersionId,
    subjectName,
    dayOfWeek,
    startMinutes,
    endMinutes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'timetable_slots';
  @override
  VerificationContext validateIntegrity(
    Insertable<TimetableSlot> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('timetable_version_id')) {
      context.handle(
        _timetableVersionIdMeta,
        timetableVersionId.isAcceptableOrUnknown(
          data['timetable_version_id']!,
          _timetableVersionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_timetableVersionIdMeta);
    }
    if (data.containsKey('subject_name')) {
      context.handle(
        _subjectNameMeta,
        subjectName.isAcceptableOrUnknown(
          data['subject_name']!,
          _subjectNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subjectNameMeta);
    }
    if (data.containsKey('day_of_week')) {
      context.handle(
        _dayOfWeekMeta,
        dayOfWeek.isAcceptableOrUnknown(data['day_of_week']!, _dayOfWeekMeta),
      );
    } else if (isInserting) {
      context.missing(_dayOfWeekMeta);
    }
    if (data.containsKey('start_minutes')) {
      context.handle(
        _startMinutesMeta,
        startMinutes.isAcceptableOrUnknown(
          data['start_minutes']!,
          _startMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_startMinutesMeta);
    }
    if (data.containsKey('end_minutes')) {
      context.handle(
        _endMinutesMeta,
        endMinutes.isAcceptableOrUnknown(data['end_minutes']!, _endMinutesMeta),
      );
    } else if (isInserting) {
      context.missing(_endMinutesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TimetableSlot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimetableSlot(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      timetableVersionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timetable_version_id'],
      )!,
      subjectName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subject_name'],
      )!,
      dayOfWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_of_week'],
      )!,
      startMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_minutes'],
      )!,
      endMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_minutes'],
      )!,
    );
  }

  @override
  $TimetableSlotsTable createAlias(String alias) {
    return $TimetableSlotsTable(attachedDatabase, alias);
  }
}

class TimetableSlot extends DataClass implements Insertable<TimetableSlot> {
  final int id;
  final int timetableVersionId;
  final String subjectName;
  final int dayOfWeek;
  final int startMinutes;
  final int endMinutes;
  const TimetableSlot({
    required this.id,
    required this.timetableVersionId,
    required this.subjectName,
    required this.dayOfWeek,
    required this.startMinutes,
    required this.endMinutes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['timetable_version_id'] = Variable<int>(timetableVersionId);
    map['subject_name'] = Variable<String>(subjectName);
    map['day_of_week'] = Variable<int>(dayOfWeek);
    map['start_minutes'] = Variable<int>(startMinutes);
    map['end_minutes'] = Variable<int>(endMinutes);
    return map;
  }

  TimetableSlotsCompanion toCompanion(bool nullToAbsent) {
    return TimetableSlotsCompanion(
      id: Value(id),
      timetableVersionId: Value(timetableVersionId),
      subjectName: Value(subjectName),
      dayOfWeek: Value(dayOfWeek),
      startMinutes: Value(startMinutes),
      endMinutes: Value(endMinutes),
    );
  }

  factory TimetableSlot.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimetableSlot(
      id: serializer.fromJson<int>(json['id']),
      timetableVersionId: serializer.fromJson<int>(json['timetableVersionId']),
      subjectName: serializer.fromJson<String>(json['subjectName']),
      dayOfWeek: serializer.fromJson<int>(json['dayOfWeek']),
      startMinutes: serializer.fromJson<int>(json['startMinutes']),
      endMinutes: serializer.fromJson<int>(json['endMinutes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timetableVersionId': serializer.toJson<int>(timetableVersionId),
      'subjectName': serializer.toJson<String>(subjectName),
      'dayOfWeek': serializer.toJson<int>(dayOfWeek),
      'startMinutes': serializer.toJson<int>(startMinutes),
      'endMinutes': serializer.toJson<int>(endMinutes),
    };
  }

  TimetableSlot copyWith({
    int? id,
    int? timetableVersionId,
    String? subjectName,
    int? dayOfWeek,
    int? startMinutes,
    int? endMinutes,
  }) => TimetableSlot(
    id: id ?? this.id,
    timetableVersionId: timetableVersionId ?? this.timetableVersionId,
    subjectName: subjectName ?? this.subjectName,
    dayOfWeek: dayOfWeek ?? this.dayOfWeek,
    startMinutes: startMinutes ?? this.startMinutes,
    endMinutes: endMinutes ?? this.endMinutes,
  );
  TimetableSlot copyWithCompanion(TimetableSlotsCompanion data) {
    return TimetableSlot(
      id: data.id.present ? data.id.value : this.id,
      timetableVersionId: data.timetableVersionId.present
          ? data.timetableVersionId.value
          : this.timetableVersionId,
      subjectName: data.subjectName.present
          ? data.subjectName.value
          : this.subjectName,
      dayOfWeek: data.dayOfWeek.present ? data.dayOfWeek.value : this.dayOfWeek,
      startMinutes: data.startMinutes.present
          ? data.startMinutes.value
          : this.startMinutes,
      endMinutes: data.endMinutes.present
          ? data.endMinutes.value
          : this.endMinutes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TimetableSlot(')
          ..write('id: $id, ')
          ..write('timetableVersionId: $timetableVersionId, ')
          ..write('subjectName: $subjectName, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('startMinutes: $startMinutes, ')
          ..write('endMinutes: $endMinutes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    timetableVersionId,
    subjectName,
    dayOfWeek,
    startMinutes,
    endMinutes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimetableSlot &&
          other.id == this.id &&
          other.timetableVersionId == this.timetableVersionId &&
          other.subjectName == this.subjectName &&
          other.dayOfWeek == this.dayOfWeek &&
          other.startMinutes == this.startMinutes &&
          other.endMinutes == this.endMinutes);
}

class TimetableSlotsCompanion extends UpdateCompanion<TimetableSlot> {
  final Value<int> id;
  final Value<int> timetableVersionId;
  final Value<String> subjectName;
  final Value<int> dayOfWeek;
  final Value<int> startMinutes;
  final Value<int> endMinutes;
  const TimetableSlotsCompanion({
    this.id = const Value.absent(),
    this.timetableVersionId = const Value.absent(),
    this.subjectName = const Value.absent(),
    this.dayOfWeek = const Value.absent(),
    this.startMinutes = const Value.absent(),
    this.endMinutes = const Value.absent(),
  });
  TimetableSlotsCompanion.insert({
    this.id = const Value.absent(),
    required int timetableVersionId,
    required String subjectName,
    required int dayOfWeek,
    required int startMinutes,
    required int endMinutes,
  }) : timetableVersionId = Value(timetableVersionId),
       subjectName = Value(subjectName),
       dayOfWeek = Value(dayOfWeek),
       startMinutes = Value(startMinutes),
       endMinutes = Value(endMinutes);
  static Insertable<TimetableSlot> custom({
    Expression<int>? id,
    Expression<int>? timetableVersionId,
    Expression<String>? subjectName,
    Expression<int>? dayOfWeek,
    Expression<int>? startMinutes,
    Expression<int>? endMinutes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timetableVersionId != null)
        'timetable_version_id': timetableVersionId,
      if (subjectName != null) 'subject_name': subjectName,
      if (dayOfWeek != null) 'day_of_week': dayOfWeek,
      if (startMinutes != null) 'start_minutes': startMinutes,
      if (endMinutes != null) 'end_minutes': endMinutes,
    });
  }

  TimetableSlotsCompanion copyWith({
    Value<int>? id,
    Value<int>? timetableVersionId,
    Value<String>? subjectName,
    Value<int>? dayOfWeek,
    Value<int>? startMinutes,
    Value<int>? endMinutes,
  }) {
    return TimetableSlotsCompanion(
      id: id ?? this.id,
      timetableVersionId: timetableVersionId ?? this.timetableVersionId,
      subjectName: subjectName ?? this.subjectName,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      startMinutes: startMinutes ?? this.startMinutes,
      endMinutes: endMinutes ?? this.endMinutes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timetableVersionId.present) {
      map['timetable_version_id'] = Variable<int>(timetableVersionId.value);
    }
    if (subjectName.present) {
      map['subject_name'] = Variable<String>(subjectName.value);
    }
    if (dayOfWeek.present) {
      map['day_of_week'] = Variable<int>(dayOfWeek.value);
    }
    if (startMinutes.present) {
      map['start_minutes'] = Variable<int>(startMinutes.value);
    }
    if (endMinutes.present) {
      map['end_minutes'] = Variable<int>(endMinutes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimetableSlotsCompanion(')
          ..write('id: $id, ')
          ..write('timetableVersionId: $timetableVersionId, ')
          ..write('subjectName: $subjectName, ')
          ..write('dayOfWeek: $dayOfWeek, ')
          ..write('startMinutes: $startMinutes, ')
          ..write('endMinutes: $endMinutes')
          ..write(')'))
        .toString();
  }
}

class $AttendanceRecordsTable extends AttendanceRecords
    with TableInfo<$AttendanceRecordsTable, AttendanceRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttendanceRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _slotIdMeta = const VerificationMeta('slotId');
  @override
  late final GeneratedColumn<int> slotId = GeneratedColumn<int>(
    'slot_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES timetable_slots (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timetableVersionIdMeta =
      const VerificationMeta('timetableVersionId');
  @override
  late final GeneratedColumn<int> timetableVersionId = GeneratedColumn<int>(
    'timetable_version_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES timetable_versions (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    slotId,
    date,
    status,
    timetableVersionId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attendance_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<AttendanceRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('slot_id')) {
      context.handle(
        _slotIdMeta,
        slotId.isAcceptableOrUnknown(data['slot_id']!, _slotIdMeta),
      );
    } else if (isInserting) {
      context.missing(_slotIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('timetable_version_id')) {
      context.handle(
        _timetableVersionIdMeta,
        timetableVersionId.isAcceptableOrUnknown(
          data['timetable_version_id']!,
          _timetableVersionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_timetableVersionIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AttendanceRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttendanceRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      slotId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}slot_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      timetableVersionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timetable_version_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AttendanceRecordsTable createAlias(String alias) {
    return $AttendanceRecordsTable(attachedDatabase, alias);
  }
}

class AttendanceRecord extends DataClass
    implements Insertable<AttendanceRecord> {
  final int id;
  final int slotId;
  final DateTime date;
  final String status;
  final int timetableVersionId;
  final DateTime createdAt;
  const AttendanceRecord({
    required this.id,
    required this.slotId,
    required this.date,
    required this.status,
    required this.timetableVersionId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['slot_id'] = Variable<int>(slotId);
    map['date'] = Variable<DateTime>(date);
    map['status'] = Variable<String>(status);
    map['timetable_version_id'] = Variable<int>(timetableVersionId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AttendanceRecordsCompanion toCompanion(bool nullToAbsent) {
    return AttendanceRecordsCompanion(
      id: Value(id),
      slotId: Value(slotId),
      date: Value(date),
      status: Value(status),
      timetableVersionId: Value(timetableVersionId),
      createdAt: Value(createdAt),
    );
  }

  factory AttendanceRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttendanceRecord(
      id: serializer.fromJson<int>(json['id']),
      slotId: serializer.fromJson<int>(json['slotId']),
      date: serializer.fromJson<DateTime>(json['date']),
      status: serializer.fromJson<String>(json['status']),
      timetableVersionId: serializer.fromJson<int>(json['timetableVersionId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'slotId': serializer.toJson<int>(slotId),
      'date': serializer.toJson<DateTime>(date),
      'status': serializer.toJson<String>(status),
      'timetableVersionId': serializer.toJson<int>(timetableVersionId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AttendanceRecord copyWith({
    int? id,
    int? slotId,
    DateTime? date,
    String? status,
    int? timetableVersionId,
    DateTime? createdAt,
  }) => AttendanceRecord(
    id: id ?? this.id,
    slotId: slotId ?? this.slotId,
    date: date ?? this.date,
    status: status ?? this.status,
    timetableVersionId: timetableVersionId ?? this.timetableVersionId,
    createdAt: createdAt ?? this.createdAt,
  );
  AttendanceRecord copyWithCompanion(AttendanceRecordsCompanion data) {
    return AttendanceRecord(
      id: data.id.present ? data.id.value : this.id,
      slotId: data.slotId.present ? data.slotId.value : this.slotId,
      date: data.date.present ? data.date.value : this.date,
      status: data.status.present ? data.status.value : this.status,
      timetableVersionId: data.timetableVersionId.present
          ? data.timetableVersionId.value
          : this.timetableVersionId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceRecord(')
          ..write('id: $id, ')
          ..write('slotId: $slotId, ')
          ..write('date: $date, ')
          ..write('status: $status, ')
          ..write('timetableVersionId: $timetableVersionId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, slotId, date, status, timetableVersionId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttendanceRecord &&
          other.id == this.id &&
          other.slotId == this.slotId &&
          other.date == this.date &&
          other.status == this.status &&
          other.timetableVersionId == this.timetableVersionId &&
          other.createdAt == this.createdAt);
}

class AttendanceRecordsCompanion extends UpdateCompanion<AttendanceRecord> {
  final Value<int> id;
  final Value<int> slotId;
  final Value<DateTime> date;
  final Value<String> status;
  final Value<int> timetableVersionId;
  final Value<DateTime> createdAt;
  const AttendanceRecordsCompanion({
    this.id = const Value.absent(),
    this.slotId = const Value.absent(),
    this.date = const Value.absent(),
    this.status = const Value.absent(),
    this.timetableVersionId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AttendanceRecordsCompanion.insert({
    this.id = const Value.absent(),
    required int slotId,
    required DateTime date,
    required String status,
    required int timetableVersionId,
    required DateTime createdAt,
  }) : slotId = Value(slotId),
       date = Value(date),
       status = Value(status),
       timetableVersionId = Value(timetableVersionId),
       createdAt = Value(createdAt);
  static Insertable<AttendanceRecord> custom({
    Expression<int>? id,
    Expression<int>? slotId,
    Expression<DateTime>? date,
    Expression<String>? status,
    Expression<int>? timetableVersionId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (slotId != null) 'slot_id': slotId,
      if (date != null) 'date': date,
      if (status != null) 'status': status,
      if (timetableVersionId != null)
        'timetable_version_id': timetableVersionId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AttendanceRecordsCompanion copyWith({
    Value<int>? id,
    Value<int>? slotId,
    Value<DateTime>? date,
    Value<String>? status,
    Value<int>? timetableVersionId,
    Value<DateTime>? createdAt,
  }) {
    return AttendanceRecordsCompanion(
      id: id ?? this.id,
      slotId: slotId ?? this.slotId,
      date: date ?? this.date,
      status: status ?? this.status,
      timetableVersionId: timetableVersionId ?? this.timetableVersionId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (slotId.present) {
      map['slot_id'] = Variable<int>(slotId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (timetableVersionId.present) {
      map['timetable_version_id'] = Variable<int>(timetableVersionId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceRecordsCompanion(')
          ..write('id: $id, ')
          ..write('slotId: $slotId, ')
          ..write('date: $date, ')
          ..write('status: $status, ')
          ..write('timetableVersionId: $timetableVersionId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $AttendanceEventsTable extends AttendanceEvents
    with TableInfo<$AttendanceEventsTable, AttendanceEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttendanceEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _recordIdMeta = const VerificationMeta(
    'recordId',
  );
  @override
  late final GeneratedColumn<int> recordId = GeneratedColumn<int>(
    'record_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES attendance_records (id)',
    ),
  );
  static const VerificationMeta _oldStatusMeta = const VerificationMeta(
    'oldStatus',
  );
  @override
  late final GeneratedColumn<String> oldStatus = GeneratedColumn<String>(
    'old_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _newStatusMeta = const VerificationMeta(
    'newStatus',
  );
  @override
  late final GeneratedColumn<String> newStatus = GeneratedColumn<String>(
    'new_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _editedAtMeta = const VerificationMeta(
    'editedAt',
  );
  @override
  late final GeneratedColumn<DateTime> editedAt = GeneratedColumn<DateTime>(
    'edited_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recordId,
    oldStatus,
    newStatus,
    editedAt,
    deviceId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attendance_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<AttendanceEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('record_id')) {
      context.handle(
        _recordIdMeta,
        recordId.isAcceptableOrUnknown(data['record_id']!, _recordIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recordIdMeta);
    }
    if (data.containsKey('old_status')) {
      context.handle(
        _oldStatusMeta,
        oldStatus.isAcceptableOrUnknown(data['old_status']!, _oldStatusMeta),
      );
    } else if (isInserting) {
      context.missing(_oldStatusMeta);
    }
    if (data.containsKey('new_status')) {
      context.handle(
        _newStatusMeta,
        newStatus.isAcceptableOrUnknown(data['new_status']!, _newStatusMeta),
      );
    } else if (isInserting) {
      context.missing(_newStatusMeta);
    }
    if (data.containsKey('edited_at')) {
      context.handle(
        _editedAtMeta,
        editedAt.isAcceptableOrUnknown(data['edited_at']!, _editedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_editedAtMeta);
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AttendanceEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttendanceEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      recordId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}record_id'],
      )!,
      oldStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}old_status'],
      )!,
      newStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}new_status'],
      )!,
      editedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}edited_at'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      )!,
    );
  }

  @override
  $AttendanceEventsTable createAlias(String alias) {
    return $AttendanceEventsTable(attachedDatabase, alias);
  }
}

class AttendanceEvent extends DataClass implements Insertable<AttendanceEvent> {
  final int id;
  final int recordId;
  final String oldStatus;
  final String newStatus;
  final DateTime editedAt;
  final String deviceId;
  const AttendanceEvent({
    required this.id,
    required this.recordId,
    required this.oldStatus,
    required this.newStatus,
    required this.editedAt,
    required this.deviceId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['record_id'] = Variable<int>(recordId);
    map['old_status'] = Variable<String>(oldStatus);
    map['new_status'] = Variable<String>(newStatus);
    map['edited_at'] = Variable<DateTime>(editedAt);
    map['device_id'] = Variable<String>(deviceId);
    return map;
  }

  AttendanceEventsCompanion toCompanion(bool nullToAbsent) {
    return AttendanceEventsCompanion(
      id: Value(id),
      recordId: Value(recordId),
      oldStatus: Value(oldStatus),
      newStatus: Value(newStatus),
      editedAt: Value(editedAt),
      deviceId: Value(deviceId),
    );
  }

  factory AttendanceEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttendanceEvent(
      id: serializer.fromJson<int>(json['id']),
      recordId: serializer.fromJson<int>(json['recordId']),
      oldStatus: serializer.fromJson<String>(json['oldStatus']),
      newStatus: serializer.fromJson<String>(json['newStatus']),
      editedAt: serializer.fromJson<DateTime>(json['editedAt']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'recordId': serializer.toJson<int>(recordId),
      'oldStatus': serializer.toJson<String>(oldStatus),
      'newStatus': serializer.toJson<String>(newStatus),
      'editedAt': serializer.toJson<DateTime>(editedAt),
      'deviceId': serializer.toJson<String>(deviceId),
    };
  }

  AttendanceEvent copyWith({
    int? id,
    int? recordId,
    String? oldStatus,
    String? newStatus,
    DateTime? editedAt,
    String? deviceId,
  }) => AttendanceEvent(
    id: id ?? this.id,
    recordId: recordId ?? this.recordId,
    oldStatus: oldStatus ?? this.oldStatus,
    newStatus: newStatus ?? this.newStatus,
    editedAt: editedAt ?? this.editedAt,
    deviceId: deviceId ?? this.deviceId,
  );
  AttendanceEvent copyWithCompanion(AttendanceEventsCompanion data) {
    return AttendanceEvent(
      id: data.id.present ? data.id.value : this.id,
      recordId: data.recordId.present ? data.recordId.value : this.recordId,
      oldStatus: data.oldStatus.present ? data.oldStatus.value : this.oldStatus,
      newStatus: data.newStatus.present ? data.newStatus.value : this.newStatus,
      editedAt: data.editedAt.present ? data.editedAt.value : this.editedAt,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceEvent(')
          ..write('id: $id, ')
          ..write('recordId: $recordId, ')
          ..write('oldStatus: $oldStatus, ')
          ..write('newStatus: $newStatus, ')
          ..write('editedAt: $editedAt, ')
          ..write('deviceId: $deviceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, recordId, oldStatus, newStatus, editedAt, deviceId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttendanceEvent &&
          other.id == this.id &&
          other.recordId == this.recordId &&
          other.oldStatus == this.oldStatus &&
          other.newStatus == this.newStatus &&
          other.editedAt == this.editedAt &&
          other.deviceId == this.deviceId);
}

class AttendanceEventsCompanion extends UpdateCompanion<AttendanceEvent> {
  final Value<int> id;
  final Value<int> recordId;
  final Value<String> oldStatus;
  final Value<String> newStatus;
  final Value<DateTime> editedAt;
  final Value<String> deviceId;
  const AttendanceEventsCompanion({
    this.id = const Value.absent(),
    this.recordId = const Value.absent(),
    this.oldStatus = const Value.absent(),
    this.newStatus = const Value.absent(),
    this.editedAt = const Value.absent(),
    this.deviceId = const Value.absent(),
  });
  AttendanceEventsCompanion.insert({
    this.id = const Value.absent(),
    required int recordId,
    required String oldStatus,
    required String newStatus,
    required DateTime editedAt,
    required String deviceId,
  }) : recordId = Value(recordId),
       oldStatus = Value(oldStatus),
       newStatus = Value(newStatus),
       editedAt = Value(editedAt),
       deviceId = Value(deviceId);
  static Insertable<AttendanceEvent> custom({
    Expression<int>? id,
    Expression<int>? recordId,
    Expression<String>? oldStatus,
    Expression<String>? newStatus,
    Expression<DateTime>? editedAt,
    Expression<String>? deviceId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recordId != null) 'record_id': recordId,
      if (oldStatus != null) 'old_status': oldStatus,
      if (newStatus != null) 'new_status': newStatus,
      if (editedAt != null) 'edited_at': editedAt,
      if (deviceId != null) 'device_id': deviceId,
    });
  }

  AttendanceEventsCompanion copyWith({
    Value<int>? id,
    Value<int>? recordId,
    Value<String>? oldStatus,
    Value<String>? newStatus,
    Value<DateTime>? editedAt,
    Value<String>? deviceId,
  }) {
    return AttendanceEventsCompanion(
      id: id ?? this.id,
      recordId: recordId ?? this.recordId,
      oldStatus: oldStatus ?? this.oldStatus,
      newStatus: newStatus ?? this.newStatus,
      editedAt: editedAt ?? this.editedAt,
      deviceId: deviceId ?? this.deviceId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (recordId.present) {
      map['record_id'] = Variable<int>(recordId.value);
    }
    if (oldStatus.present) {
      map['old_status'] = Variable<String>(oldStatus.value);
    }
    if (newStatus.present) {
      map['new_status'] = Variable<String>(newStatus.value);
    }
    if (editedAt.present) {
      map['edited_at'] = Variable<DateTime>(editedAt.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceEventsCompanion(')
          ..write('id: $id, ')
          ..write('recordId: $recordId, ')
          ..write('oldStatus: $oldStatus, ')
          ..write('newStatus: $newStatus, ')
          ..write('editedAt: $editedAt, ')
          ..write('deviceId: $deviceId')
          ..write(')'))
        .toString();
  }
}

class $SubjectStatsTable extends SubjectStats
    with TableInfo<$SubjectStatsTable, SubjectStat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectStatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _slotIdMeta = const VerificationMeta('slotId');
  @override
  late final GeneratedColumn<int> slotId = GeneratedColumn<int>(
    'slot_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES timetable_slots (id)',
    ),
  );
  static const VerificationMeta _presentCountMeta = const VerificationMeta(
    'presentCount',
  );
  @override
  late final GeneratedColumn<int> presentCount = GeneratedColumn<int>(
    'present_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _absentCountMeta = const VerificationMeta(
    'absentCount',
  );
  @override
  late final GeneratedColumn<int> absentCount = GeneratedColumn<int>(
    'absent_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [slotId, presentCount, absentCount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subject_stats';
  @override
  VerificationContext validateIntegrity(
    Insertable<SubjectStat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('slot_id')) {
      context.handle(
        _slotIdMeta,
        slotId.isAcceptableOrUnknown(data['slot_id']!, _slotIdMeta),
      );
    }
    if (data.containsKey('present_count')) {
      context.handle(
        _presentCountMeta,
        presentCount.isAcceptableOrUnknown(
          data['present_count']!,
          _presentCountMeta,
        ),
      );
    }
    if (data.containsKey('absent_count')) {
      context.handle(
        _absentCountMeta,
        absentCount.isAcceptableOrUnknown(
          data['absent_count']!,
          _absentCountMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {slotId};
  @override
  SubjectStat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubjectStat(
      slotId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}slot_id'],
      )!,
      presentCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}present_count'],
      )!,
      absentCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}absent_count'],
      )!,
    );
  }

  @override
  $SubjectStatsTable createAlias(String alias) {
    return $SubjectStatsTable(attachedDatabase, alias);
  }
}

class SubjectStat extends DataClass implements Insertable<SubjectStat> {
  final int slotId;
  final int presentCount;
  final int absentCount;
  const SubjectStat({
    required this.slotId,
    required this.presentCount,
    required this.absentCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['slot_id'] = Variable<int>(slotId);
    map['present_count'] = Variable<int>(presentCount);
    map['absent_count'] = Variable<int>(absentCount);
    return map;
  }

  SubjectStatsCompanion toCompanion(bool nullToAbsent) {
    return SubjectStatsCompanion(
      slotId: Value(slotId),
      presentCount: Value(presentCount),
      absentCount: Value(absentCount),
    );
  }

  factory SubjectStat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubjectStat(
      slotId: serializer.fromJson<int>(json['slotId']),
      presentCount: serializer.fromJson<int>(json['presentCount']),
      absentCount: serializer.fromJson<int>(json['absentCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'slotId': serializer.toJson<int>(slotId),
      'presentCount': serializer.toJson<int>(presentCount),
      'absentCount': serializer.toJson<int>(absentCount),
    };
  }

  SubjectStat copyWith({int? slotId, int? presentCount, int? absentCount}) =>
      SubjectStat(
        slotId: slotId ?? this.slotId,
        presentCount: presentCount ?? this.presentCount,
        absentCount: absentCount ?? this.absentCount,
      );
  SubjectStat copyWithCompanion(SubjectStatsCompanion data) {
    return SubjectStat(
      slotId: data.slotId.present ? data.slotId.value : this.slotId,
      presentCount: data.presentCount.present
          ? data.presentCount.value
          : this.presentCount,
      absentCount: data.absentCount.present
          ? data.absentCount.value
          : this.absentCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubjectStat(')
          ..write('slotId: $slotId, ')
          ..write('presentCount: $presentCount, ')
          ..write('absentCount: $absentCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(slotId, presentCount, absentCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubjectStat &&
          other.slotId == this.slotId &&
          other.presentCount == this.presentCount &&
          other.absentCount == this.absentCount);
}

class SubjectStatsCompanion extends UpdateCompanion<SubjectStat> {
  final Value<int> slotId;
  final Value<int> presentCount;
  final Value<int> absentCount;
  const SubjectStatsCompanion({
    this.slotId = const Value.absent(),
    this.presentCount = const Value.absent(),
    this.absentCount = const Value.absent(),
  });
  SubjectStatsCompanion.insert({
    this.slotId = const Value.absent(),
    this.presentCount = const Value.absent(),
    this.absentCount = const Value.absent(),
  });
  static Insertable<SubjectStat> custom({
    Expression<int>? slotId,
    Expression<int>? presentCount,
    Expression<int>? absentCount,
  }) {
    return RawValuesInsertable({
      if (slotId != null) 'slot_id': slotId,
      if (presentCount != null) 'present_count': presentCount,
      if (absentCount != null) 'absent_count': absentCount,
    });
  }

  SubjectStatsCompanion copyWith({
    Value<int>? slotId,
    Value<int>? presentCount,
    Value<int>? absentCount,
  }) {
    return SubjectStatsCompanion(
      slotId: slotId ?? this.slotId,
      presentCount: presentCount ?? this.presentCount,
      absentCount: absentCount ?? this.absentCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (slotId.present) {
      map['slot_id'] = Variable<int>(slotId.value);
    }
    if (presentCount.present) {
      map['present_count'] = Variable<int>(presentCount.value);
    }
    if (absentCount.present) {
      map['absent_count'] = Variable<int>(absentCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectStatsCompanion(')
          ..write('slotId: $slotId, ')
          ..write('presentCount: $presentCount, ')
          ..write('absentCount: $absentCount')
          ..write(')'))
        .toString();
  }
}

class $SemesterStatsTable extends SemesterStats
    with TableInfo<$SemesterStatsTable, SemesterStat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SemesterStatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _totalPresentMeta = const VerificationMeta(
    'totalPresent',
  );
  @override
  late final GeneratedColumn<int> totalPresent = GeneratedColumn<int>(
    'total_present',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalAbsentMeta = const VerificationMeta(
    'totalAbsent',
  );
  @override
  late final GeneratedColumn<int> totalAbsent = GeneratedColumn<int>(
    'total_absent',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, totalPresent, totalAbsent];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'semester_stats';
  @override
  VerificationContext validateIntegrity(
    Insertable<SemesterStat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('total_present')) {
      context.handle(
        _totalPresentMeta,
        totalPresent.isAcceptableOrUnknown(
          data['total_present']!,
          _totalPresentMeta,
        ),
      );
    }
    if (data.containsKey('total_absent')) {
      context.handle(
        _totalAbsentMeta,
        totalAbsent.isAcceptableOrUnknown(
          data['total_absent']!,
          _totalAbsentMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SemesterStat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SemesterStat(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      totalPresent: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_present'],
      )!,
      totalAbsent: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_absent'],
      )!,
    );
  }

  @override
  $SemesterStatsTable createAlias(String alias) {
    return $SemesterStatsTable(attachedDatabase, alias);
  }
}

class SemesterStat extends DataClass implements Insertable<SemesterStat> {
  final int id;
  final int totalPresent;
  final int totalAbsent;
  const SemesterStat({
    required this.id,
    required this.totalPresent,
    required this.totalAbsent,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['total_present'] = Variable<int>(totalPresent);
    map['total_absent'] = Variable<int>(totalAbsent);
    return map;
  }

  SemesterStatsCompanion toCompanion(bool nullToAbsent) {
    return SemesterStatsCompanion(
      id: Value(id),
      totalPresent: Value(totalPresent),
      totalAbsent: Value(totalAbsent),
    );
  }

  factory SemesterStat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SemesterStat(
      id: serializer.fromJson<int>(json['id']),
      totalPresent: serializer.fromJson<int>(json['totalPresent']),
      totalAbsent: serializer.fromJson<int>(json['totalAbsent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'totalPresent': serializer.toJson<int>(totalPresent),
      'totalAbsent': serializer.toJson<int>(totalAbsent),
    };
  }

  SemesterStat copyWith({int? id, int? totalPresent, int? totalAbsent}) =>
      SemesterStat(
        id: id ?? this.id,
        totalPresent: totalPresent ?? this.totalPresent,
        totalAbsent: totalAbsent ?? this.totalAbsent,
      );
  SemesterStat copyWithCompanion(SemesterStatsCompanion data) {
    return SemesterStat(
      id: data.id.present ? data.id.value : this.id,
      totalPresent: data.totalPresent.present
          ? data.totalPresent.value
          : this.totalPresent,
      totalAbsent: data.totalAbsent.present
          ? data.totalAbsent.value
          : this.totalAbsent,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SemesterStat(')
          ..write('id: $id, ')
          ..write('totalPresent: $totalPresent, ')
          ..write('totalAbsent: $totalAbsent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, totalPresent, totalAbsent);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SemesterStat &&
          other.id == this.id &&
          other.totalPresent == this.totalPresent &&
          other.totalAbsent == this.totalAbsent);
}

class SemesterStatsCompanion extends UpdateCompanion<SemesterStat> {
  final Value<int> id;
  final Value<int> totalPresent;
  final Value<int> totalAbsent;
  const SemesterStatsCompanion({
    this.id = const Value.absent(),
    this.totalPresent = const Value.absent(),
    this.totalAbsent = const Value.absent(),
  });
  SemesterStatsCompanion.insert({
    this.id = const Value.absent(),
    this.totalPresent = const Value.absent(),
    this.totalAbsent = const Value.absent(),
  });
  static Insertable<SemesterStat> custom({
    Expression<int>? id,
    Expression<int>? totalPresent,
    Expression<int>? totalAbsent,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (totalPresent != null) 'total_present': totalPresent,
      if (totalAbsent != null) 'total_absent': totalAbsent,
    });
  }

  SemesterStatsCompanion copyWith({
    Value<int>? id,
    Value<int>? totalPresent,
    Value<int>? totalAbsent,
  }) {
    return SemesterStatsCompanion(
      id: id ?? this.id,
      totalPresent: totalPresent ?? this.totalPresent,
      totalAbsent: totalAbsent ?? this.totalAbsent,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (totalPresent.present) {
      map['total_present'] = Variable<int>(totalPresent.value);
    }
    if (totalAbsent.present) {
      map['total_absent'] = Variable<int>(totalAbsent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SemesterStatsCompanion(')
          ..write('id: $id, ')
          ..write('totalPresent: $totalPresent, ')
          ..write('totalAbsent: $totalAbsent')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TimetableVersionsTable timetableVersions =
      $TimetableVersionsTable(this);
  late final $TimetableSlotsTable timetableSlots = $TimetableSlotsTable(this);
  late final $AttendanceRecordsTable attendanceRecords =
      $AttendanceRecordsTable(this);
  late final $AttendanceEventsTable attendanceEvents = $AttendanceEventsTable(
    this,
  );
  late final $SubjectStatsTable subjectStats = $SubjectStatsTable(this);
  late final $SemesterStatsTable semesterStats = $SemesterStatsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    timetableVersions,
    timetableSlots,
    attendanceRecords,
    attendanceEvents,
    subjectStats,
    semesterStats,
  ];
}

typedef $$TimetableVersionsTableCreateCompanionBuilder =
    TimetableVersionsCompanion Function({
      Value<int> id,
      required DateTime createdAt,
      Value<bool> isActive,
    });
typedef $$TimetableVersionsTableUpdateCompanionBuilder =
    TimetableVersionsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      Value<bool> isActive,
    });

final class $$TimetableVersionsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $TimetableVersionsTable,
          TimetableVersion
        > {
  $$TimetableVersionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$TimetableSlotsTable, List<TimetableSlot>>
  _timetableSlotsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.timetableSlots,
    aliasName: $_aliasNameGenerator(
      db.timetableVersions.id,
      db.timetableSlots.timetableVersionId,
    ),
  );

  $$TimetableSlotsTableProcessedTableManager get timetableSlotsRefs {
    final manager = $$TimetableSlotsTableTableManager($_db, $_db.timetableSlots)
        .filter(
          (f) => f.timetableVersionId.id.sqlEquals($_itemColumn<int>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_timetableSlotsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AttendanceRecordsTable, List<AttendanceRecord>>
  _attendanceRecordsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.attendanceRecords,
        aliasName: $_aliasNameGenerator(
          db.timetableVersions.id,
          db.attendanceRecords.timetableVersionId,
        ),
      );

  $$AttendanceRecordsTableProcessedTableManager get attendanceRecordsRefs {
    final manager =
        $$AttendanceRecordsTableTableManager(
          $_db,
          $_db.attendanceRecords,
        ).filter(
          (f) => f.timetableVersionId.id.sqlEquals($_itemColumn<int>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _attendanceRecordsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TimetableVersionsTableFilterComposer
    extends Composer<_$AppDatabase, $TimetableVersionsTable> {
  $$TimetableVersionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> timetableSlotsRefs(
    Expression<bool> Function($$TimetableSlotsTableFilterComposer f) f,
  ) {
    final $$TimetableSlotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.timetableSlots,
      getReferencedColumn: (t) => t.timetableVersionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableSlotsTableFilterComposer(
            $db: $db,
            $table: $db.timetableSlots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> attendanceRecordsRefs(
    Expression<bool> Function($$AttendanceRecordsTableFilterComposer f) f,
  ) {
    final $$AttendanceRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.attendanceRecords,
      getReferencedColumn: (t) => t.timetableVersionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendanceRecordsTableFilterComposer(
            $db: $db,
            $table: $db.attendanceRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TimetableVersionsTableOrderingComposer
    extends Composer<_$AppDatabase, $TimetableVersionsTable> {
  $$TimetableVersionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TimetableVersionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TimetableVersionsTable> {
  $$TimetableVersionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  Expression<T> timetableSlotsRefs<T extends Object>(
    Expression<T> Function($$TimetableSlotsTableAnnotationComposer a) f,
  ) {
    final $$TimetableSlotsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.timetableSlots,
      getReferencedColumn: (t) => t.timetableVersionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableSlotsTableAnnotationComposer(
            $db: $db,
            $table: $db.timetableSlots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> attendanceRecordsRefs<T extends Object>(
    Expression<T> Function($$AttendanceRecordsTableAnnotationComposer a) f,
  ) {
    final $$AttendanceRecordsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.attendanceRecords,
          getReferencedColumn: (t) => t.timetableVersionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AttendanceRecordsTableAnnotationComposer(
                $db: $db,
                $table: $db.attendanceRecords,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$TimetableVersionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TimetableVersionsTable,
          TimetableVersion,
          $$TimetableVersionsTableFilterComposer,
          $$TimetableVersionsTableOrderingComposer,
          $$TimetableVersionsTableAnnotationComposer,
          $$TimetableVersionsTableCreateCompanionBuilder,
          $$TimetableVersionsTableUpdateCompanionBuilder,
          (TimetableVersion, $$TimetableVersionsTableReferences),
          TimetableVersion,
          PrefetchHooks Function({
            bool timetableSlotsRefs,
            bool attendanceRecordsRefs,
          })
        > {
  $$TimetableVersionsTableTableManager(
    _$AppDatabase db,
    $TimetableVersionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimetableVersionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimetableVersionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimetableVersionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => TimetableVersionsCompanion(
                id: id,
                createdAt: createdAt,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime createdAt,
                Value<bool> isActive = const Value.absent(),
              }) => TimetableVersionsCompanion.insert(
                id: id,
                createdAt: createdAt,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TimetableVersionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({timetableSlotsRefs = false, attendanceRecordsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (timetableSlotsRefs) db.timetableSlots,
                    if (attendanceRecordsRefs) db.attendanceRecords,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (timetableSlotsRefs)
                        await $_getPrefetchedData<
                          TimetableVersion,
                          $TimetableVersionsTable,
                          TimetableSlot
                        >(
                          currentTable: table,
                          referencedTable: $$TimetableVersionsTableReferences
                              ._timetableSlotsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TimetableVersionsTableReferences(
                                db,
                                table,
                                p0,
                              ).timetableSlotsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.timetableVersionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (attendanceRecordsRefs)
                        await $_getPrefetchedData<
                          TimetableVersion,
                          $TimetableVersionsTable,
                          AttendanceRecord
                        >(
                          currentTable: table,
                          referencedTable: $$TimetableVersionsTableReferences
                              ._attendanceRecordsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TimetableVersionsTableReferences(
                                db,
                                table,
                                p0,
                              ).attendanceRecordsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.timetableVersionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TimetableVersionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TimetableVersionsTable,
      TimetableVersion,
      $$TimetableVersionsTableFilterComposer,
      $$TimetableVersionsTableOrderingComposer,
      $$TimetableVersionsTableAnnotationComposer,
      $$TimetableVersionsTableCreateCompanionBuilder,
      $$TimetableVersionsTableUpdateCompanionBuilder,
      (TimetableVersion, $$TimetableVersionsTableReferences),
      TimetableVersion,
      PrefetchHooks Function({
        bool timetableSlotsRefs,
        bool attendanceRecordsRefs,
      })
    >;
typedef $$TimetableSlotsTableCreateCompanionBuilder =
    TimetableSlotsCompanion Function({
      Value<int> id,
      required int timetableVersionId,
      required String subjectName,
      required int dayOfWeek,
      required int startMinutes,
      required int endMinutes,
    });
typedef $$TimetableSlotsTableUpdateCompanionBuilder =
    TimetableSlotsCompanion Function({
      Value<int> id,
      Value<int> timetableVersionId,
      Value<String> subjectName,
      Value<int> dayOfWeek,
      Value<int> startMinutes,
      Value<int> endMinutes,
    });

final class $$TimetableSlotsTableReferences
    extends BaseReferences<_$AppDatabase, $TimetableSlotsTable, TimetableSlot> {
  $$TimetableSlotsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TimetableVersionsTable _timetableVersionIdTable(_$AppDatabase db) =>
      db.timetableVersions.createAlias(
        $_aliasNameGenerator(
          db.timetableSlots.timetableVersionId,
          db.timetableVersions.id,
        ),
      );

  $$TimetableVersionsTableProcessedTableManager get timetableVersionId {
    final $_column = $_itemColumn<int>('timetable_version_id')!;

    final manager = $$TimetableVersionsTableTableManager(
      $_db,
      $_db.timetableVersions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_timetableVersionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AttendanceRecordsTable, List<AttendanceRecord>>
  _attendanceRecordsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.attendanceRecords,
        aliasName: $_aliasNameGenerator(
          db.timetableSlots.id,
          db.attendanceRecords.slotId,
        ),
      );

  $$AttendanceRecordsTableProcessedTableManager get attendanceRecordsRefs {
    final manager = $$AttendanceRecordsTableTableManager(
      $_db,
      $_db.attendanceRecords,
    ).filter((f) => f.slotId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _attendanceRecordsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SubjectStatsTable, List<SubjectStat>>
  _subjectStatsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.subjectStats,
    aliasName: $_aliasNameGenerator(
      db.timetableSlots.id,
      db.subjectStats.slotId,
    ),
  );

  $$SubjectStatsTableProcessedTableManager get subjectStatsRefs {
    final manager = $$SubjectStatsTableTableManager(
      $_db,
      $_db.subjectStats,
    ).filter((f) => f.slotId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_subjectStatsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TimetableSlotsTableFilterComposer
    extends Composer<_$AppDatabase, $TimetableSlotsTable> {
  $$TimetableSlotsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subjectName => $composableBuilder(
    column: $table.subjectName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => ColumnFilters(column),
  );

  $$TimetableVersionsTableFilterComposer get timetableVersionId {
    final $$TimetableVersionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timetableVersionId,
      referencedTable: $db.timetableVersions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableVersionsTableFilterComposer(
            $db: $db,
            $table: $db.timetableVersions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> attendanceRecordsRefs(
    Expression<bool> Function($$AttendanceRecordsTableFilterComposer f) f,
  ) {
    final $$AttendanceRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.attendanceRecords,
      getReferencedColumn: (t) => t.slotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendanceRecordsTableFilterComposer(
            $db: $db,
            $table: $db.attendanceRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> subjectStatsRefs(
    Expression<bool> Function($$SubjectStatsTableFilterComposer f) f,
  ) {
    final $$SubjectStatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.subjectStats,
      getReferencedColumn: (t) => t.slotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectStatsTableFilterComposer(
            $db: $db,
            $table: $db.subjectStats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TimetableSlotsTableOrderingComposer
    extends Composer<_$AppDatabase, $TimetableSlotsTable> {
  $$TimetableSlotsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subjectName => $composableBuilder(
    column: $table.subjectName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dayOfWeek => $composableBuilder(
    column: $table.dayOfWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  $$TimetableVersionsTableOrderingComposer get timetableVersionId {
    final $$TimetableVersionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timetableVersionId,
      referencedTable: $db.timetableVersions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableVersionsTableOrderingComposer(
            $db: $db,
            $table: $db.timetableVersions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TimetableSlotsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TimetableSlotsTable> {
  $$TimetableSlotsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get subjectName => $composableBuilder(
    column: $table.subjectName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dayOfWeek =>
      $composableBuilder(column: $table.dayOfWeek, builder: (column) => column);

  GeneratedColumn<int> get startMinutes => $composableBuilder(
    column: $table.startMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get endMinutes => $composableBuilder(
    column: $table.endMinutes,
    builder: (column) => column,
  );

  $$TimetableVersionsTableAnnotationComposer get timetableVersionId {
    final $$TimetableVersionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.timetableVersionId,
          referencedTable: $db.timetableVersions,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TimetableVersionsTableAnnotationComposer(
                $db: $db,
                $table: $db.timetableVersions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> attendanceRecordsRefs<T extends Object>(
    Expression<T> Function($$AttendanceRecordsTableAnnotationComposer a) f,
  ) {
    final $$AttendanceRecordsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.attendanceRecords,
          getReferencedColumn: (t) => t.slotId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AttendanceRecordsTableAnnotationComposer(
                $db: $db,
                $table: $db.attendanceRecords,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> subjectStatsRefs<T extends Object>(
    Expression<T> Function($$SubjectStatsTableAnnotationComposer a) f,
  ) {
    final $$SubjectStatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.subjectStats,
      getReferencedColumn: (t) => t.slotId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectStatsTableAnnotationComposer(
            $db: $db,
            $table: $db.subjectStats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TimetableSlotsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TimetableSlotsTable,
          TimetableSlot,
          $$TimetableSlotsTableFilterComposer,
          $$TimetableSlotsTableOrderingComposer,
          $$TimetableSlotsTableAnnotationComposer,
          $$TimetableSlotsTableCreateCompanionBuilder,
          $$TimetableSlotsTableUpdateCompanionBuilder,
          (TimetableSlot, $$TimetableSlotsTableReferences),
          TimetableSlot,
          PrefetchHooks Function({
            bool timetableVersionId,
            bool attendanceRecordsRefs,
            bool subjectStatsRefs,
          })
        > {
  $$TimetableSlotsTableTableManager(
    _$AppDatabase db,
    $TimetableSlotsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimetableSlotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimetableSlotsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimetableSlotsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> timetableVersionId = const Value.absent(),
                Value<String> subjectName = const Value.absent(),
                Value<int> dayOfWeek = const Value.absent(),
                Value<int> startMinutes = const Value.absent(),
                Value<int> endMinutes = const Value.absent(),
              }) => TimetableSlotsCompanion(
                id: id,
                timetableVersionId: timetableVersionId,
                subjectName: subjectName,
                dayOfWeek: dayOfWeek,
                startMinutes: startMinutes,
                endMinutes: endMinutes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int timetableVersionId,
                required String subjectName,
                required int dayOfWeek,
                required int startMinutes,
                required int endMinutes,
              }) => TimetableSlotsCompanion.insert(
                id: id,
                timetableVersionId: timetableVersionId,
                subjectName: subjectName,
                dayOfWeek: dayOfWeek,
                startMinutes: startMinutes,
                endMinutes: endMinutes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TimetableSlotsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                timetableVersionId = false,
                attendanceRecordsRefs = false,
                subjectStatsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (attendanceRecordsRefs) db.attendanceRecords,
                    if (subjectStatsRefs) db.subjectStats,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (timetableVersionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.timetableVersionId,
                                    referencedTable:
                                        $$TimetableSlotsTableReferences
                                            ._timetableVersionIdTable(db),
                                    referencedColumn:
                                        $$TimetableSlotsTableReferences
                                            ._timetableVersionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (attendanceRecordsRefs)
                        await $_getPrefetchedData<
                          TimetableSlot,
                          $TimetableSlotsTable,
                          AttendanceRecord
                        >(
                          currentTable: table,
                          referencedTable: $$TimetableSlotsTableReferences
                              ._attendanceRecordsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TimetableSlotsTableReferences(
                                db,
                                table,
                                p0,
                              ).attendanceRecordsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.slotId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (subjectStatsRefs)
                        await $_getPrefetchedData<
                          TimetableSlot,
                          $TimetableSlotsTable,
                          SubjectStat
                        >(
                          currentTable: table,
                          referencedTable: $$TimetableSlotsTableReferences
                              ._subjectStatsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TimetableSlotsTableReferences(
                                db,
                                table,
                                p0,
                              ).subjectStatsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.slotId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TimetableSlotsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TimetableSlotsTable,
      TimetableSlot,
      $$TimetableSlotsTableFilterComposer,
      $$TimetableSlotsTableOrderingComposer,
      $$TimetableSlotsTableAnnotationComposer,
      $$TimetableSlotsTableCreateCompanionBuilder,
      $$TimetableSlotsTableUpdateCompanionBuilder,
      (TimetableSlot, $$TimetableSlotsTableReferences),
      TimetableSlot,
      PrefetchHooks Function({
        bool timetableVersionId,
        bool attendanceRecordsRefs,
        bool subjectStatsRefs,
      })
    >;
typedef $$AttendanceRecordsTableCreateCompanionBuilder =
    AttendanceRecordsCompanion Function({
      Value<int> id,
      required int slotId,
      required DateTime date,
      required String status,
      required int timetableVersionId,
      required DateTime createdAt,
    });
typedef $$AttendanceRecordsTableUpdateCompanionBuilder =
    AttendanceRecordsCompanion Function({
      Value<int> id,
      Value<int> slotId,
      Value<DateTime> date,
      Value<String> status,
      Value<int> timetableVersionId,
      Value<DateTime> createdAt,
    });

final class $$AttendanceRecordsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AttendanceRecordsTable,
          AttendanceRecord
        > {
  $$AttendanceRecordsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TimetableSlotsTable _slotIdTable(_$AppDatabase db) =>
      db.timetableSlots.createAlias(
        $_aliasNameGenerator(db.attendanceRecords.slotId, db.timetableSlots.id),
      );

  $$TimetableSlotsTableProcessedTableManager get slotId {
    final $_column = $_itemColumn<int>('slot_id')!;

    final manager = $$TimetableSlotsTableTableManager(
      $_db,
      $_db.timetableSlots,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_slotIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TimetableVersionsTable _timetableVersionIdTable(_$AppDatabase db) =>
      db.timetableVersions.createAlias(
        $_aliasNameGenerator(
          db.attendanceRecords.timetableVersionId,
          db.timetableVersions.id,
        ),
      );

  $$TimetableVersionsTableProcessedTableManager get timetableVersionId {
    final $_column = $_itemColumn<int>('timetable_version_id')!;

    final manager = $$TimetableVersionsTableTableManager(
      $_db,
      $_db.timetableVersions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_timetableVersionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AttendanceEventsTable, List<AttendanceEvent>>
  _attendanceEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.attendanceEvents,
    aliasName: $_aliasNameGenerator(
      db.attendanceRecords.id,
      db.attendanceEvents.recordId,
    ),
  );

  $$AttendanceEventsTableProcessedTableManager get attendanceEventsRefs {
    final manager = $$AttendanceEventsTableTableManager(
      $_db,
      $_db.attendanceEvents,
    ).filter((f) => f.recordId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _attendanceEventsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AttendanceRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $AttendanceRecordsTable> {
  $$AttendanceRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TimetableSlotsTableFilterComposer get slotId {
    final $$TimetableSlotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.slotId,
      referencedTable: $db.timetableSlots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableSlotsTableFilterComposer(
            $db: $db,
            $table: $db.timetableSlots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TimetableVersionsTableFilterComposer get timetableVersionId {
    final $$TimetableVersionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timetableVersionId,
      referencedTable: $db.timetableVersions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableVersionsTableFilterComposer(
            $db: $db,
            $table: $db.timetableVersions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> attendanceEventsRefs(
    Expression<bool> Function($$AttendanceEventsTableFilterComposer f) f,
  ) {
    final $$AttendanceEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.attendanceEvents,
      getReferencedColumn: (t) => t.recordId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendanceEventsTableFilterComposer(
            $db: $db,
            $table: $db.attendanceEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AttendanceRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $AttendanceRecordsTable> {
  $$AttendanceRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TimetableSlotsTableOrderingComposer get slotId {
    final $$TimetableSlotsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.slotId,
      referencedTable: $db.timetableSlots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableSlotsTableOrderingComposer(
            $db: $db,
            $table: $db.timetableSlots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TimetableVersionsTableOrderingComposer get timetableVersionId {
    final $$TimetableVersionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timetableVersionId,
      referencedTable: $db.timetableVersions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableVersionsTableOrderingComposer(
            $db: $db,
            $table: $db.timetableVersions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendanceRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AttendanceRecordsTable> {
  $$AttendanceRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$TimetableSlotsTableAnnotationComposer get slotId {
    final $$TimetableSlotsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.slotId,
      referencedTable: $db.timetableSlots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableSlotsTableAnnotationComposer(
            $db: $db,
            $table: $db.timetableSlots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TimetableVersionsTableAnnotationComposer get timetableVersionId {
    final $$TimetableVersionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.timetableVersionId,
          referencedTable: $db.timetableVersions,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$TimetableVersionsTableAnnotationComposer(
                $db: $db,
                $table: $db.timetableVersions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> attendanceEventsRefs<T extends Object>(
    Expression<T> Function($$AttendanceEventsTableAnnotationComposer a) f,
  ) {
    final $$AttendanceEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.attendanceEvents,
      getReferencedColumn: (t) => t.recordId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendanceEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.attendanceEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AttendanceRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AttendanceRecordsTable,
          AttendanceRecord,
          $$AttendanceRecordsTableFilterComposer,
          $$AttendanceRecordsTableOrderingComposer,
          $$AttendanceRecordsTableAnnotationComposer,
          $$AttendanceRecordsTableCreateCompanionBuilder,
          $$AttendanceRecordsTableUpdateCompanionBuilder,
          (AttendanceRecord, $$AttendanceRecordsTableReferences),
          AttendanceRecord,
          PrefetchHooks Function({
            bool slotId,
            bool timetableVersionId,
            bool attendanceEventsRefs,
          })
        > {
  $$AttendanceRecordsTableTableManager(
    _$AppDatabase db,
    $AttendanceRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttendanceRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttendanceRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttendanceRecordsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> slotId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> timetableVersionId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AttendanceRecordsCompanion(
                id: id,
                slotId: slotId,
                date: date,
                status: status,
                timetableVersionId: timetableVersionId,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int slotId,
                required DateTime date,
                required String status,
                required int timetableVersionId,
                required DateTime createdAt,
              }) => AttendanceRecordsCompanion.insert(
                id: id,
                slotId: slotId,
                date: date,
                status: status,
                timetableVersionId: timetableVersionId,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AttendanceRecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                slotId = false,
                timetableVersionId = false,
                attendanceEventsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (attendanceEventsRefs) db.attendanceEvents,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (slotId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.slotId,
                                    referencedTable:
                                        $$AttendanceRecordsTableReferences
                                            ._slotIdTable(db),
                                    referencedColumn:
                                        $$AttendanceRecordsTableReferences
                                            ._slotIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (timetableVersionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.timetableVersionId,
                                    referencedTable:
                                        $$AttendanceRecordsTableReferences
                                            ._timetableVersionIdTable(db),
                                    referencedColumn:
                                        $$AttendanceRecordsTableReferences
                                            ._timetableVersionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (attendanceEventsRefs)
                        await $_getPrefetchedData<
                          AttendanceRecord,
                          $AttendanceRecordsTable,
                          AttendanceEvent
                        >(
                          currentTable: table,
                          referencedTable: $$AttendanceRecordsTableReferences
                              ._attendanceEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AttendanceRecordsTableReferences(
                                db,
                                table,
                                p0,
                              ).attendanceEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recordId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AttendanceRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AttendanceRecordsTable,
      AttendanceRecord,
      $$AttendanceRecordsTableFilterComposer,
      $$AttendanceRecordsTableOrderingComposer,
      $$AttendanceRecordsTableAnnotationComposer,
      $$AttendanceRecordsTableCreateCompanionBuilder,
      $$AttendanceRecordsTableUpdateCompanionBuilder,
      (AttendanceRecord, $$AttendanceRecordsTableReferences),
      AttendanceRecord,
      PrefetchHooks Function({
        bool slotId,
        bool timetableVersionId,
        bool attendanceEventsRefs,
      })
    >;
typedef $$AttendanceEventsTableCreateCompanionBuilder =
    AttendanceEventsCompanion Function({
      Value<int> id,
      required int recordId,
      required String oldStatus,
      required String newStatus,
      required DateTime editedAt,
      required String deviceId,
    });
typedef $$AttendanceEventsTableUpdateCompanionBuilder =
    AttendanceEventsCompanion Function({
      Value<int> id,
      Value<int> recordId,
      Value<String> oldStatus,
      Value<String> newStatus,
      Value<DateTime> editedAt,
      Value<String> deviceId,
    });

final class $$AttendanceEventsTableReferences
    extends
        BaseReferences<_$AppDatabase, $AttendanceEventsTable, AttendanceEvent> {
  $$AttendanceEventsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AttendanceRecordsTable _recordIdTable(_$AppDatabase db) =>
      db.attendanceRecords.createAlias(
        $_aliasNameGenerator(
          db.attendanceEvents.recordId,
          db.attendanceRecords.id,
        ),
      );

  $$AttendanceRecordsTableProcessedTableManager get recordId {
    final $_column = $_itemColumn<int>('record_id')!;

    final manager = $$AttendanceRecordsTableTableManager(
      $_db,
      $_db.attendanceRecords,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recordIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AttendanceEventsTableFilterComposer
    extends Composer<_$AppDatabase, $AttendanceEventsTable> {
  $$AttendanceEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get oldStatus => $composableBuilder(
    column: $table.oldStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get newStatus => $composableBuilder(
    column: $table.newStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get editedAt => $composableBuilder(
    column: $table.editedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  $$AttendanceRecordsTableFilterComposer get recordId {
    final $$AttendanceRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recordId,
      referencedTable: $db.attendanceRecords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendanceRecordsTableFilterComposer(
            $db: $db,
            $table: $db.attendanceRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendanceEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $AttendanceEventsTable> {
  $$AttendanceEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get oldStatus => $composableBuilder(
    column: $table.oldStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get newStatus => $composableBuilder(
    column: $table.newStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get editedAt => $composableBuilder(
    column: $table.editedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  $$AttendanceRecordsTableOrderingComposer get recordId {
    final $$AttendanceRecordsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recordId,
      referencedTable: $db.attendanceRecords,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendanceRecordsTableOrderingComposer(
            $db: $db,
            $table: $db.attendanceRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendanceEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AttendanceEventsTable> {
  $$AttendanceEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get oldStatus =>
      $composableBuilder(column: $table.oldStatus, builder: (column) => column);

  GeneratedColumn<String> get newStatus =>
      $composableBuilder(column: $table.newStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get editedAt =>
      $composableBuilder(column: $table.editedAt, builder: (column) => column);

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  $$AttendanceRecordsTableAnnotationComposer get recordId {
    final $$AttendanceRecordsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.recordId,
          referencedTable: $db.attendanceRecords,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AttendanceRecordsTableAnnotationComposer(
                $db: $db,
                $table: $db.attendanceRecords,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$AttendanceEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AttendanceEventsTable,
          AttendanceEvent,
          $$AttendanceEventsTableFilterComposer,
          $$AttendanceEventsTableOrderingComposer,
          $$AttendanceEventsTableAnnotationComposer,
          $$AttendanceEventsTableCreateCompanionBuilder,
          $$AttendanceEventsTableUpdateCompanionBuilder,
          (AttendanceEvent, $$AttendanceEventsTableReferences),
          AttendanceEvent,
          PrefetchHooks Function({bool recordId})
        > {
  $$AttendanceEventsTableTableManager(
    _$AppDatabase db,
    $AttendanceEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttendanceEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttendanceEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttendanceEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> recordId = const Value.absent(),
                Value<String> oldStatus = const Value.absent(),
                Value<String> newStatus = const Value.absent(),
                Value<DateTime> editedAt = const Value.absent(),
                Value<String> deviceId = const Value.absent(),
              }) => AttendanceEventsCompanion(
                id: id,
                recordId: recordId,
                oldStatus: oldStatus,
                newStatus: newStatus,
                editedAt: editedAt,
                deviceId: deviceId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int recordId,
                required String oldStatus,
                required String newStatus,
                required DateTime editedAt,
                required String deviceId,
              }) => AttendanceEventsCompanion.insert(
                id: id,
                recordId: recordId,
                oldStatus: oldStatus,
                newStatus: newStatus,
                editedAt: editedAt,
                deviceId: deviceId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AttendanceEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recordId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (recordId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.recordId,
                                referencedTable:
                                    $$AttendanceEventsTableReferences
                                        ._recordIdTable(db),
                                referencedColumn:
                                    $$AttendanceEventsTableReferences
                                        ._recordIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AttendanceEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AttendanceEventsTable,
      AttendanceEvent,
      $$AttendanceEventsTableFilterComposer,
      $$AttendanceEventsTableOrderingComposer,
      $$AttendanceEventsTableAnnotationComposer,
      $$AttendanceEventsTableCreateCompanionBuilder,
      $$AttendanceEventsTableUpdateCompanionBuilder,
      (AttendanceEvent, $$AttendanceEventsTableReferences),
      AttendanceEvent,
      PrefetchHooks Function({bool recordId})
    >;
typedef $$SubjectStatsTableCreateCompanionBuilder =
    SubjectStatsCompanion Function({
      Value<int> slotId,
      Value<int> presentCount,
      Value<int> absentCount,
    });
typedef $$SubjectStatsTableUpdateCompanionBuilder =
    SubjectStatsCompanion Function({
      Value<int> slotId,
      Value<int> presentCount,
      Value<int> absentCount,
    });

final class $$SubjectStatsTableReferences
    extends BaseReferences<_$AppDatabase, $SubjectStatsTable, SubjectStat> {
  $$SubjectStatsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TimetableSlotsTable _slotIdTable(_$AppDatabase db) =>
      db.timetableSlots.createAlias(
        $_aliasNameGenerator(db.subjectStats.slotId, db.timetableSlots.id),
      );

  $$TimetableSlotsTableProcessedTableManager get slotId {
    final $_column = $_itemColumn<int>('slot_id')!;

    final manager = $$TimetableSlotsTableTableManager(
      $_db,
      $_db.timetableSlots,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_slotIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SubjectStatsTableFilterComposer
    extends Composer<_$AppDatabase, $SubjectStatsTable> {
  $$SubjectStatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get presentCount => $composableBuilder(
    column: $table.presentCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get absentCount => $composableBuilder(
    column: $table.absentCount,
    builder: (column) => ColumnFilters(column),
  );

  $$TimetableSlotsTableFilterComposer get slotId {
    final $$TimetableSlotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.slotId,
      referencedTable: $db.timetableSlots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableSlotsTableFilterComposer(
            $db: $db,
            $table: $db.timetableSlots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubjectStatsTableOrderingComposer
    extends Composer<_$AppDatabase, $SubjectStatsTable> {
  $$SubjectStatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get presentCount => $composableBuilder(
    column: $table.presentCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get absentCount => $composableBuilder(
    column: $table.absentCount,
    builder: (column) => ColumnOrderings(column),
  );

  $$TimetableSlotsTableOrderingComposer get slotId {
    final $$TimetableSlotsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.slotId,
      referencedTable: $db.timetableSlots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableSlotsTableOrderingComposer(
            $db: $db,
            $table: $db.timetableSlots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubjectStatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubjectStatsTable> {
  $$SubjectStatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get presentCount => $composableBuilder(
    column: $table.presentCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get absentCount => $composableBuilder(
    column: $table.absentCount,
    builder: (column) => column,
  );

  $$TimetableSlotsTableAnnotationComposer get slotId {
    final $$TimetableSlotsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.slotId,
      referencedTable: $db.timetableSlots,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableSlotsTableAnnotationComposer(
            $db: $db,
            $table: $db.timetableSlots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubjectStatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubjectStatsTable,
          SubjectStat,
          $$SubjectStatsTableFilterComposer,
          $$SubjectStatsTableOrderingComposer,
          $$SubjectStatsTableAnnotationComposer,
          $$SubjectStatsTableCreateCompanionBuilder,
          $$SubjectStatsTableUpdateCompanionBuilder,
          (SubjectStat, $$SubjectStatsTableReferences),
          SubjectStat,
          PrefetchHooks Function({bool slotId})
        > {
  $$SubjectStatsTableTableManager(_$AppDatabase db, $SubjectStatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubjectStatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubjectStatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubjectStatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> slotId = const Value.absent(),
                Value<int> presentCount = const Value.absent(),
                Value<int> absentCount = const Value.absent(),
              }) => SubjectStatsCompanion(
                slotId: slotId,
                presentCount: presentCount,
                absentCount: absentCount,
              ),
          createCompanionCallback:
              ({
                Value<int> slotId = const Value.absent(),
                Value<int> presentCount = const Value.absent(),
                Value<int> absentCount = const Value.absent(),
              }) => SubjectStatsCompanion.insert(
                slotId: slotId,
                presentCount: presentCount,
                absentCount: absentCount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SubjectStatsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({slotId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (slotId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.slotId,
                                referencedTable: $$SubjectStatsTableReferences
                                    ._slotIdTable(db),
                                referencedColumn: $$SubjectStatsTableReferences
                                    ._slotIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SubjectStatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubjectStatsTable,
      SubjectStat,
      $$SubjectStatsTableFilterComposer,
      $$SubjectStatsTableOrderingComposer,
      $$SubjectStatsTableAnnotationComposer,
      $$SubjectStatsTableCreateCompanionBuilder,
      $$SubjectStatsTableUpdateCompanionBuilder,
      (SubjectStat, $$SubjectStatsTableReferences),
      SubjectStat,
      PrefetchHooks Function({bool slotId})
    >;
typedef $$SemesterStatsTableCreateCompanionBuilder =
    SemesterStatsCompanion Function({
      Value<int> id,
      Value<int> totalPresent,
      Value<int> totalAbsent,
    });
typedef $$SemesterStatsTableUpdateCompanionBuilder =
    SemesterStatsCompanion Function({
      Value<int> id,
      Value<int> totalPresent,
      Value<int> totalAbsent,
    });

class $$SemesterStatsTableFilterComposer
    extends Composer<_$AppDatabase, $SemesterStatsTable> {
  $$SemesterStatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalPresent => $composableBuilder(
    column: $table.totalPresent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalAbsent => $composableBuilder(
    column: $table.totalAbsent,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SemesterStatsTableOrderingComposer
    extends Composer<_$AppDatabase, $SemesterStatsTable> {
  $$SemesterStatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalPresent => $composableBuilder(
    column: $table.totalPresent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalAbsent => $composableBuilder(
    column: $table.totalAbsent,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SemesterStatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SemesterStatsTable> {
  $$SemesterStatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get totalPresent => $composableBuilder(
    column: $table.totalPresent,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalAbsent => $composableBuilder(
    column: $table.totalAbsent,
    builder: (column) => column,
  );
}

class $$SemesterStatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SemesterStatsTable,
          SemesterStat,
          $$SemesterStatsTableFilterComposer,
          $$SemesterStatsTableOrderingComposer,
          $$SemesterStatsTableAnnotationComposer,
          $$SemesterStatsTableCreateCompanionBuilder,
          $$SemesterStatsTableUpdateCompanionBuilder,
          (
            SemesterStat,
            BaseReferences<_$AppDatabase, $SemesterStatsTable, SemesterStat>,
          ),
          SemesterStat,
          PrefetchHooks Function()
        > {
  $$SemesterStatsTableTableManager(_$AppDatabase db, $SemesterStatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SemesterStatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SemesterStatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SemesterStatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> totalPresent = const Value.absent(),
                Value<int> totalAbsent = const Value.absent(),
              }) => SemesterStatsCompanion(
                id: id,
                totalPresent: totalPresent,
                totalAbsent: totalAbsent,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> totalPresent = const Value.absent(),
                Value<int> totalAbsent = const Value.absent(),
              }) => SemesterStatsCompanion.insert(
                id: id,
                totalPresent: totalPresent,
                totalAbsent: totalAbsent,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SemesterStatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SemesterStatsTable,
      SemesterStat,
      $$SemesterStatsTableFilterComposer,
      $$SemesterStatsTableOrderingComposer,
      $$SemesterStatsTableAnnotationComposer,
      $$SemesterStatsTableCreateCompanionBuilder,
      $$SemesterStatsTableUpdateCompanionBuilder,
      (
        SemesterStat,
        BaseReferences<_$AppDatabase, $SemesterStatsTable, SemesterStat>,
      ),
      SemesterStat,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TimetableVersionsTableTableManager get timetableVersions =>
      $$TimetableVersionsTableTableManager(_db, _db.timetableVersions);
  $$TimetableSlotsTableTableManager get timetableSlots =>
      $$TimetableSlotsTableTableManager(_db, _db.timetableSlots);
  $$AttendanceRecordsTableTableManager get attendanceRecords =>
      $$AttendanceRecordsTableTableManager(_db, _db.attendanceRecords);
  $$AttendanceEventsTableTableManager get attendanceEvents =>
      $$AttendanceEventsTableTableManager(_db, _db.attendanceEvents);
  $$SubjectStatsTableTableManager get subjectStats =>
      $$SubjectStatsTableTableManager(_db, _db.subjectStats);
  $$SemesterStatsTableTableManager get semesterStats =>
      $$SemesterStatsTableTableManager(_db, _db.semesterStats);
}

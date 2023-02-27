// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_node.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetStoryNodeCollection on Isar {
  IsarCollection<StoryNode> get storyNodes => this.collection();
}

const StoryNodeSchema = CollectionSchema(
  name: r'StoryNode',
  id: 8086388564011406003,
  properties: {
    r'nodeName': PropertySchema(
      id: 0,
      name: r'nodeName',
      type: IsarType.string,
    )
  },
  estimateSize: _storyNodeEstimateSize,
  serialize: _storyNodeSerialize,
  deserialize: _storyNodeDeserialize,
  deserializeProp: _storyNodeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _storyNodeGetId,
  getLinks: _storyNodeGetLinks,
  attach: _storyNodeAttach,
  version: '3.0.5',
);

int _storyNodeEstimateSize(
  StoryNode object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.nodeName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _storyNodeSerialize(
  StoryNode object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.nodeName);
}

StoryNode _storyNodeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StoryNode();
  object.id = id;
  object.nodeName = reader.readStringOrNull(offsets[0]);
  return object;
}

P _storyNodeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _storyNodeGetId(StoryNode object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _storyNodeGetLinks(StoryNode object) {
  return [];
}

void _storyNodeAttach(IsarCollection<dynamic> col, Id id, StoryNode object) {
  object.id = id;
}

extension StoryNodeQueryWhereSort
    on QueryBuilder<StoryNode, StoryNode, QWhere> {
  QueryBuilder<StoryNode, StoryNode, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StoryNodeQueryWhere
    on QueryBuilder<StoryNode, StoryNode, QWhereClause> {
  QueryBuilder<StoryNode, StoryNode, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StoryNodeQueryFilter
    on QueryBuilder<StoryNode, StoryNode, QFilterCondition> {
  QueryBuilder<StoryNode, StoryNode, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterFilterCondition> nodeNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nodeName',
      ));
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterFilterCondition>
      nodeNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nodeName',
      ));
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterFilterCondition> nodeNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nodeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterFilterCondition> nodeNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nodeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterFilterCondition> nodeNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nodeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterFilterCondition> nodeNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nodeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterFilterCondition> nodeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nodeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterFilterCondition> nodeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nodeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterFilterCondition> nodeNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nodeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterFilterCondition> nodeNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nodeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterFilterCondition> nodeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nodeName',
        value: '',
      ));
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterFilterCondition>
      nodeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nodeName',
        value: '',
      ));
    });
  }
}

extension StoryNodeQueryObject
    on QueryBuilder<StoryNode, StoryNode, QFilterCondition> {}

extension StoryNodeQueryLinks
    on QueryBuilder<StoryNode, StoryNode, QFilterCondition> {}

extension StoryNodeQuerySortBy on QueryBuilder<StoryNode, StoryNode, QSortBy> {
  QueryBuilder<StoryNode, StoryNode, QAfterSortBy> sortByNodeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nodeName', Sort.asc);
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterSortBy> sortByNodeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nodeName', Sort.desc);
    });
  }
}

extension StoryNodeQuerySortThenBy
    on QueryBuilder<StoryNode, StoryNode, QSortThenBy> {
  QueryBuilder<StoryNode, StoryNode, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterSortBy> thenByNodeName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nodeName', Sort.asc);
    });
  }

  QueryBuilder<StoryNode, StoryNode, QAfterSortBy> thenByNodeNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nodeName', Sort.desc);
    });
  }
}

extension StoryNodeQueryWhereDistinct
    on QueryBuilder<StoryNode, StoryNode, QDistinct> {
  QueryBuilder<StoryNode, StoryNode, QDistinct> distinctByNodeName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nodeName', caseSensitive: caseSensitive);
    });
  }
}

extension StoryNodeQueryProperty
    on QueryBuilder<StoryNode, StoryNode, QQueryProperty> {
  QueryBuilder<StoryNode, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StoryNode, String?, QQueryOperations> nodeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nodeName');
    });
  }
}

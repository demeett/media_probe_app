// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'most_popular_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MostPopularResponse _$MostPopularResponseFromJson(Map<String, dynamic> json) =>
    MostPopularResponse(
      status: json['status'] as String?,
      copyright: json['copyright'] as String?,
      numResults: json['num_results'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MostPopularResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MostPopularResponseToJson(
        MostPopularResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'num_results': instance.numResults,
      'results': instance.results,
    };

MostPopularResult _$MostPopularResultFromJson(Map<String, dynamic> json) =>
    MostPopularResult(
      publishedDate: json['published_date'] as String?,
      updated: json['updated'] as String?,
      byline: json['byline'] as String?,
      title: json['title'] as String?,
      abstract: json['abstract'] as String?,
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => MostPopularMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MostPopularResultToJson(MostPopularResult instance) =>
    <String, dynamic>{
      'published_date': instance.publishedDate,
      'updated': instance.updated,
      'byline': instance.byline,
      'title': instance.title,
      'abstract': instance.abstract,
      'media': instance.media,
    };

MostPopularMedia _$MostPopularMediaFromJson(Map<String, dynamic> json) =>
    MostPopularMedia(
      type: json['type'] as String?,
      subtype: json['subtype'] as String?,
      caption: json['caption'] as String?,
      copyright: json['copyright'] as String?,
      approvedForSyndication: json['approvedForSyndication'] as int?,
      mediaMetadata: (json['media-metadata'] as List<dynamic>?)
          ?.map((e) => MediaMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MostPopularMediaToJson(MostPopularMedia instance) =>
    <String, dynamic>{
      'type': instance.type,
      'subtype': instance.subtype,
      'caption': instance.caption,
      'copyright': instance.copyright,
      'approvedForSyndication': instance.approvedForSyndication,
      'media-metadata': instance.mediaMetadata,
    };

MediaMetadata _$MediaMetadataFromJson(Map<String, dynamic> json) =>
    MediaMetadata(
      url: json['url'] as String?,
      format: json['format'] as String?,
      height: json['height'] as int?,
      width: json['width'] as int?,
    );

Map<String, dynamic> _$MediaMetadataToJson(MediaMetadata instance) =>
    <String, dynamic>{
      'url': instance.url,
      'format': instance.format,
      'height': instance.height,
      'width': instance.width,
    };

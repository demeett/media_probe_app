import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'most_popular_response.g.dart';

@JsonSerializable()
class MostPopularResponse extends Equatable {
  final String? status;
  final String? copyright;
  @JsonKey(name: "num_results")
  final int? numResults;
  final List<MostPopularResult>? results;

  const MostPopularResponse({this.status, this.copyright, this.numResults, this.results});
  factory MostPopularResponse.fromJson(Map<String, dynamic> json) => _$MostPopularResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MostPopularResponseToJson(this);
  @override
  List<Object?> get props => [status, copyright, numResults, results];
}

@JsonSerializable()
class MostPopularResult extends Equatable {
  @JsonKey(name: "published_date")
  final String? publishedDate;
  final String? updated;
  final String? byline;
  final String? title;
  final String? abstract;
  final List<MostPopularMedia>? media;

  const MostPopularResult({
    this.publishedDate,
    this.updated,
    this.byline,
    this.title,
    this.abstract,
    this.media,
  });

  factory MostPopularResult.fromJson(Map<String, dynamic> json) => _$MostPopularResultFromJson(json);

  Map<String, dynamic> toJson() => _$MostPopularResultToJson(this);

  @override
  List<Object?> get props => [publishedDate, updated, byline, title, abstract, media];
}

@JsonSerializable()
class MostPopularMedia extends Equatable {
  final String? type;
  final String? subtype;
  final String? caption;
  final String? copyright;
  final int? approvedForSyndication;
  @JsonKey(name: "media-metadata")
  final List<MediaMetadata>? mediaMetadata;

  const MostPopularMedia({
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
    this.approvedForSyndication,
    this.mediaMetadata,
  });

  factory MostPopularMedia.fromJson(Map<String, dynamic> json) => _$MostPopularMediaFromJson(json);

  Map<String, dynamic> toJson() => _$MostPopularMediaToJson(this);

  @override
  List<Object?> get props => [
        type,
        subtype,
        caption,
        copyright,
        approvedForSyndication,
        mediaMetadata,
      ];
}

@JsonSerializable()
class MediaMetadata extends Equatable {
  final String? url;
  final String? format;
  final int? height;
  final int? width;

  const MediaMetadata({
    this.url,
    this.format,
    this.height,
    this.width,
  });

  factory MediaMetadata.fromJson(Map<String, dynamic> json) => _$MediaMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MediaMetadataToJson(this);

  @override
  List<Object?> get props => [url, format, height, width];
}

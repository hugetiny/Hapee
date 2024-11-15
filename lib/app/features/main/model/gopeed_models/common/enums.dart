import 'package:json_annotation/json_annotation.dart';

enum Status {
  @JsonValue("ready") ready,
  @JsonValue("running") running,
  @JsonValue("pause") pause,
  @JsonValue("wait") wait,
  @JsonValue("error") error,
  @JsonValue("done") done,
}

enum Protocol {
  @JsonValue("") none,
  @JsonValue("http") http,
  @JsonValue("bt") bt,
}

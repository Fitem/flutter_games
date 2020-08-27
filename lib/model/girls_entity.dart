import 'package:flutter_games/generated/json/base/json_convert_content.dart';
import 'package:flutter_games/generated/json/base/json_field.dart';

class GirlsEntity with JsonConvert<GirlsEntity> {
	bool error;
	List<GirlsResult> results;
}

class GirlsResult with JsonConvert<GirlsResult> {
	@JSONField(name: "_id")
	String sId;
	String createdAt;
	String desc;
	String publishedAt;
	String source;
	String type;
	String url;
	bool used;
	String who;
}

import 'package:flutter_games/model/girls_entity.dart';

girlsEntityFromJson(GirlsEntity data, Map<String, dynamic> json) {
	if (json['error'] != null) {
		data.error = json['error'];
	}
	if (json['results'] != null) {
		data.results = new List<GirlsResult>();
		(json['results'] as List).forEach((v) {
			data.results.add(new GirlsResult().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> girlsEntityToJson(GirlsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['error'] = entity.error;
	if (entity.results != null) {
		data['results'] =  entity.results.map((v) => v.toJson()).toList();
	}
	return data;
}

girlsResultFromJson(GirlsResult data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['createdAt'] != null) {
		data.createdAt = json['createdAt']?.toString();
	}
	if (json['desc'] != null) {
		data.desc = json['desc']?.toString();
	}
	if (json['publishedAt'] != null) {
		data.publishedAt = json['publishedAt']?.toString();
	}
	if (json['source'] != null) {
		data.source = json['source']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['used'] != null) {
		data.used = json['used'];
	}
	if (json['who'] != null) {
		data.who = json['who']?.toString();
	}
	return data;
}

Map<String, dynamic> girlsResultToJson(GirlsResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	data['createdAt'] = entity.createdAt;
	data['desc'] = entity.desc;
	data['publishedAt'] = entity.publishedAt;
	data['source'] = entity.source;
	data['type'] = entity.type;
	data['url'] = entity.url;
	data['used'] = entity.used;
	data['who'] = entity.who;
	return data;
}
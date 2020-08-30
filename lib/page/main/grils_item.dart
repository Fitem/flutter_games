import 'package:flutter/material.dart';
import 'package:flutter_games/common/style/app_style.dart';
import 'package:flutter_games/model/girls_entity.dart';

class GirlsItem extends StatelessWidget {
  const GirlsItem(this.result);

  final GirlsResult result;

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Image.network(result.url ?? AppICons.DEFAULT_REMOTE_PIC),
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(2.0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
    );
  }
}

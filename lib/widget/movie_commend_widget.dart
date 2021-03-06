import 'package:douban_movie_flutter/model/comment_vo.dart';
import 'package:douban_movie_flutter/service/resource_manager.dart';
import 'package:douban_movie_flutter/utils/screen_util.dart';
import 'package:douban_movie_flutter/widget/rating_widget.dart';
import 'package:douban_movie_flutter/widget/skeleton/skeleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cache_image_widget.dart';
import 'expandable_text.dart';

/**
 * 电影评论列表item组件
 */
class MovieCommendItemWidget extends StatelessWidget {
  final CommentVo commentVo;

  MovieCommendItemWidget(this.commentVo, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 14,
        ),
        Row(
          children: <Widget>[
           CacheImageWidget(
                url: commentVo.author.avatar,
                radius: 15,
                width: 30,
                height: 30,
              ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  commentVo.author.name,
                  style: TextStyle(
                      fontSize: 14,
                      color: ThemeHelper.wrapDarkColor(context, Colors.black87),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2),
                StaticRatingBar(
                  rate: commentVo.rating.value / 2,
                  size: 12,
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ExpandableText(
          text: commentVo.content,
          maxLines: 4,
          style: TextStyle(fontSize: 14, color: ThemeHelper.wrapDarkColor(context, Colors.black54)),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.thumb_up,
              color: ThemeHelper.wrapDarkColor(context, Colors.black26),
              size: 12,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '${commentVo.usefulCount}',
              style: TextStyle(
                fontSize: 12,
                color: ThemeHelper.wrapDarkColor(context, Colors.black26),
              ),
            )
          ],
        ),
        SizedBox(
          height: 14,
        ),
        Divider(height: 1, color: Color(0xdddddddd)),
      ],
    );
  }
}


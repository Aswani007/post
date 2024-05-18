import 'package:flutter/material.dart';
import 'package:posts_all/core/theme/app_palette.dart';
import 'package:posts_all/feature/home/data/post_model.dart';
import 'package:posts_all/feature/home/page/add_post_page.dart';

import '../../../core/global/widget/card/c_card_widget.dart';
import '../../detail/page/details_page.dart';

class CardWidget extends StatelessWidget {
  final PostModel postModel;

  const CardWidget({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => DetailsPage(postModel: postModel))),
      child: CCard(
        side: const BorderSide(color: AppPalette.black,width: 3),
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text(postModel.title)),
                InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => AddPostPage(
                              postModel: postModel,
                            ))),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: Icon(Icons.edit),
                    )),
              ],
            ),
            Text(postModel.body),
          ],
        ),
      )),
    );
  }
}

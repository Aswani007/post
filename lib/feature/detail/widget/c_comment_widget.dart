import 'package:flutter/material.dart';
import 'package:posts_all/feature/detail/data/commet_model.dart';

import '../../../core/global/widget/card/c_card_widget.dart';
import '../../../core/theme/app_palette.dart';

class CommentCardWidget extends StatelessWidget {
  final CommentModel commentModel;

  const CommentCardWidget({super.key, required this.commentModel});

  @override
  Widget build(BuildContext context) {
    return CCard(
        side: const BorderSide(color: AppPalette.black,width: 3),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(commentModel.name),
              Text(commentModel.body),
            ],
          ),
        ));
  }
}

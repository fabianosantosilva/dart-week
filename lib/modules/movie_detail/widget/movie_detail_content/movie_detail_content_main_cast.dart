import 'package:dartweek/models/movie_detail_model.dart';
import 'package:dartweek/modules/movie_detail/widget/movie_detail_content/movie_cast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MovieDetailContentMainCast extends StatelessWidget {
  final MovieDetailModel? movie;
  final showPanel = false.obs;

  MovieDetailContentMainCast({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          color: Colors.grey,
        ),
        Obx(() {
          return ExpansionPanelList(
            elevation: 0,
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (panelIndex, isExpanded) {
              showPanel.toggle();
            },
            children: [
              ExpansionPanel(
                canTapOnHeader: false,
                backgroundColor: Colors.white,
                isExpanded: showPanel.value,
                headerBuilder: (context, isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Elenco",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
                body: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: movie?.cast
                            .map((c) => MovieCast(
                                  cast: c,
                                ))
                            .toList() ??
                        [],
                  ),
                ),
              )
            ],
          );
        }),
      ],
    );
  }
}

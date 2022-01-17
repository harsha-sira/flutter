import 'package:design_practice_plant_app/constants.dart';
import 'package:design_practice_plant_app/widgets/customised_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/header_with_search_box.dart';
import 'widgets/title_with_custom_undeline.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Row(
              children: [
                const TitleWithCustomUnderline(text: "Recommanded"),
                const Spacer(),
                CustomisedButton(
                  text: "More",
                  backgroundColor: kPrimaryColor,
                  press: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

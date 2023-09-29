import 'package:fight_number/locales/languages.dart';
import 'package:fight_number/model/language_model.dart';
import 'package:fight_number/styles/common_style.dart';
import 'package:fight_number/utils/utils.dart';
import 'package:fight_number/values/constants.dart';
import 'package:fight_number/values/globals.dart';
import 'package:fight_number/values/images.dart';
import 'package:fight_number/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widgets/pressable_widget.dart';

class LanguageDialog extends StatefulWidget {
  LanguageDialog();
  @override
  LanguageDialogState createState() => LanguageDialogState();
}

class LanguageDialogState extends State<LanguageDialog> {
  LanguageModel current = Language.english;

  @override
  void initState() {
    super.initState();
    current = Globals.language;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(Constants.padding16 * 2),
      insetAnimationCurve: Curves.easeIn,
      insetAnimationDuration: Duration(milliseconds: 500),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.cornerRadius),
      ),
      child: renderBody(),
    );
  }

  /// Render body
  Widget renderBody() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.bg),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(Constants.cornerRadius),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          renderButtonClose(),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    renderItemLanguage(Language.english),
                    renderItemLanguage(Language.danish),
                    renderItemLanguage(Language.dutch),
                    renderItemLanguage(Language.french),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    renderItemLanguage(Language.german),
                    renderItemLanguage(Language.italian),
                    renderItemLanguage(Language.norwegian),
                    renderItemLanguage(Language.portuguese),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    renderItemLanguage(Language.spanish),
                    renderItemLanguage(Language.swedish),
                    renderItemLanguage(Language.finnish),
                    renderItemLanguage(Language.japanese),
                  ],
                ),
              ],
            ),
          ),
          ButtonWidget(
            titleStyle: CommonStyle.text().merge(
              TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18.sp,
              ),
            ),
            // title: Localizes.privacyPolicy.tr.toUpperCase(),
            title: "PRIVACY POLICY",
            onTap: onTapClose,
            margin: const EdgeInsets.only(
              top: Constants.margin24,
            ),
          ),
          ButtonWidget(
            titleStyle: CommonStyle.text().merge(
              TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18.sp,
              ),
            ),
            // title: Localizes.termsOfUse.tr.toUpperCase(),
            title: 'TERMS OF USE',
            onTap: onTapClose,
            margin: const EdgeInsets.only(
              top: Constants.margin12,
            ),
          ),
          ButtonWidget(
            titleStyle: CommonStyle.text().merge(
              TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18.sp,
              ),
            ),
            // title: Localizes.personalData.tr.toUpperCase(),
            title: 'PERSONAL DATA',
            onTap: onTapClose,
            margin: const EdgeInsets.only(
              top: Constants.margin12,
            ),
          ),
        ],
      ),
    );
  }

  /// On tap close
  onTapClose() {
    Navigator.of(Get.context!).pop();
    FocusManager.instance.primaryFocus!.unfocus();
  }

  Widget renderButtonClose() {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(bottom: 22),
      child: PressableWidget(
        margin: EdgeInsets.zero,
        radius: 100,
        onTap: onTapClose,
        child: Image.asset(
          Images.icCloseLarge,
          scale: 2,
        ),
      ),
    );
  }

  Widget renderItemLanguage(LanguageModel lang) {
    double width = 48;
    return PressableWidget(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      radius: 100,
      color: Colors.transparent,
      onTap: () {
        setState(() {
          current = lang;
        });
        Utils.updateLanguage(lang);
      },
      child: Container(
        height: width,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
        ),
        child: ClipOval(
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
                current.code == lang.code ? Colors.transparent : Colors.black54,
                BlendMode.darken),
            child: Image.asset(
              lang.flag,
              height: width,
              width: width,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

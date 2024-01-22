import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hottel_1/x_core/x_utils/size_utils.dart';
import 'package:hottel_1/x_presentation/scr2_reservation_screen/x_provider/scr2_provider.dart';
import 'package:hottel_1/x_theme/app_decoration.dart';
import 'package:hottel_1/x_theme/custom_text_style.dart';
import 'package:hottel_1/x_theme/theme.dart';
import 'package:hottel_1/x_widgets/custom_floating_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class BuyerInfoSection extends StatelessWidget {
  const BuyerInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<Screen2Provider>();
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.dp, vertical: 13.dp),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.dp),
              Text('Информация о покупателе',
                  style: basicTheme().textTheme.titleLarge),
              SizedBox(height: 17.dp),
              _phoneNumber(context),
              SizedBox(height: 8.dp),
              _email(context, read),
              SizedBox(height: 7.dp),
              Container(
                  width: 331.dp,
                  margin: EdgeInsets.only(right: 11.dp),
                  child: Text(
                      'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: basicTheme()
                          .textTheme
                          .bodyMedium!
                          .copyWith(height: 1.20)))
            ]));
  }

//!=============================================================================
//!=======================Телефон======================================================
 Widget _phoneNumber(BuildContext context) {
    var maskFormatter = new MaskTextInputFormatter(
        mask: '(###) ###-##-##',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
    return CustomFloatingTextField(
      validator: (val) => val != null
          ? (val.length < 15 ? 'Введите номер телефона' : null)
          : null,

      labelText: 'Номер телефона',
      labelStyle: CustomTextStyles.bodyLargeOnPrimaryTransparent,
      hintText: '(***) ***-**-**',
      prefixText: '+7',
      autofocus: true,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        maskFormatter
      ],
      //maskInput:
    );
  }
//!========================Почта=====================================================
  Widget _email(BuildContext context, read) {
    return CustomFloatingTextField(
        labelText: "Почта",
        validator: (val) => read.validateEmail(val),
        //  (val) => val != null
        //     ? (val.length < 3 ? 'Введите почту' : null)
        //     : null,
        labelStyle: CustomTextStyles.bodyLargeOnPrimaryTransparent,
        hintText: 'examplemail.000@mail.ru');
  }

}

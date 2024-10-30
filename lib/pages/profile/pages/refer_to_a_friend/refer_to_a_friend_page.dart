import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/shared/widgets/role_model_appbar_widget.dart';

import '../../../../shared/constants/constant_padding.dart';

class ReferToAFriendPage extends StatefulWidget {
  const ReferToAFriendPage({super.key});

  @override
  State<ReferToAFriendPage> createState() => _ReferToAFriendPageState();
}

class _ReferToAFriendPageState extends State<ReferToAFriendPage> {
  final TextEditingController _controller = TextEditingController();

  // Method to paste text from the clipboard
  Future<void> pasteFromClipboard() async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data != null) {
      setState(() {
        _controller.text = data.text!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: RoleModelAppbarWidget(
          context,
          leadingIcon: Icons.arrow_back_ios_new,
        ),
        body: Stack(
          children: [
            //Top text [START]
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'REFER to a Friend',
                      style: context.textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: pad10All,
                      child: Text(
                        'REFER CODE',
                        style: context.textTheme.labelSmall?.copyWith(
                          color: ColorsHelper.primary,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * .05,
                      child: TextField(
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Q8F4-B6S2-S6B3-N6Z5',
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: GestureDetector(
                            onTap: () async {
                              await pasteFromClipboard();
                            },
                            child: const Icon(
                              Icons.developer_board,
                              color: ColorsHelper.primary,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Top Text [END]

            //Bottom button [START]
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * .1,
                  horizontal: 18,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('SHARE THIS APP'),
                ),
              ),
            )
            //Bottom button [END]
          ],
        ));
  }
}

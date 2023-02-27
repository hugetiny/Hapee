import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../util/mac_secure_util.dart';
import '../../../util/util.dart';

class DirectorySelector extends StatefulWidget {
  final TextEditingController controller;
  final bool showLabel;

  const DirectorySelector(
      {Key? key, required this.controller, this.showLabel = true})
      : super(key: key);

  @override
  State<DirectorySelector> createState() => _DirectorySelectorState();
}

class _DirectorySelectorState extends State<DirectorySelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextFormField(
          readOnly: Util.isWeb() ? false : true,
          controller: widget.controller,
          // style: Get.textTheme.titleMedium,
          decoration: widget.showLabel
              ? InputDecoration(
                  labelText: AppLocalizations.of(context).task_task_dir,
                )
              : null,
          validator: (v) {
            return v!.trim().isNotEmpty
                ? null
                : AppLocalizations.of(context).task_file_path_error;
          },
        )),
        !Util.isDesktop()
            ? const SizedBox.shrink()
            : IconButton(
                icon: const Icon(Icons.folder_open),
                onPressed: () async {
                  if (GetPlatform.isDesktop) {
                    var dir = await FilePicker.platform.getDirectoryPath();
                    if (dir != null) {
                      widget.controller.text = dir;
                      MacSecureUtil.saveBookmark(dir);
                    }
                  }
                })
      ],
    );
  }
}

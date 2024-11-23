import 'package:flutter/material.dart';
import 'package:hapee/app/core/models/gopeed_models/common/models.dart';
import 'package:hapee/l10n/l10n.dart';

extension StatusTextX on Status {
  String getLocalizedText(BuildContext context) {
    final l10n = context.l10n;
    switch (this) {
      case Status.running:
        return l10n.downloading;
      case Status.done:
        return l10n.downloaded;
      case Status.pause:
        return l10n.paused;
      case Status.wait:
        return l10n.task_waiting;
      case Status.error:
        return l10n.error;
      default:
        return '';
    }
  }

  Color getStatusColor(BuildContext context) {
    final theme = Theme.of(context);
    switch (this) {
      case Status.running:
        return theme.colorScheme.primary;
      case Status.pause:
        return theme.colorScheme.secondary;
      case Status.error:
        return theme.colorScheme.error;
      case Status.done:
        return theme.colorScheme.tertiary;
      case Status.wait:
        return theme.colorScheme.primary.withOpacity(0.5);
      default:
        return theme.disabledColor;
    }
  }
}

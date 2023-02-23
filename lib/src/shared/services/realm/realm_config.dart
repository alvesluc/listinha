import 'package:listinha/src/shared/services/realm/models/settings_model.dart';
import 'package:listinha/src/shared/services/realm/models/tasks_model.dart';
import 'package:realm/realm.dart';

LocalConfiguration config = Configuration.local(
  [
    SettingsModel.schema,
    Task.schema,
    Taskboard.schema,
  ],
  initialDataCallback: (realm) {
    realm.add(SettingsModel('system'));
  },
);

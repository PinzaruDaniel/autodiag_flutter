import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:presentation/controllers/home_controller.dart';
import 'package:record/record.dart';

class FakeRecorder implements AudioRecorderClient {
  bool started = false;

  @override
  Future<bool> hasPermission() async => true;

  @override
  Future<void> start(RecordConfig config, {required String path}) async {
    started = true;
  }

  @override
  Future<String?> stop() async {
    started = false;
    return null;
  }

  @override
  Future<void> dispose() async {}
}

class FakeDirectoryProvider implements DirectoryProvider {
  FakeDirectoryProvider(this.directory);

  final Directory directory;

  @override
  Future<Directory> getAppDocumentsDirectory() async => directory;
}

void main() {
  test('HomeController records and auto-stops', () async {
    final recorder = FakeRecorder();
    final controller = HomeController(
      recorder: recorder,
      directoryProvider: FakeDirectoryProvider(Directory.systemTemp),
      maxDuration: const Duration(milliseconds: 20),
    );

    await controller.startRecording();
    expect(controller.isRecording.value, isTrue);

    await Future.delayed(const Duration(milliseconds: 40));
    expect(controller.isRecording.value, isFalse);

    controller.onClose();
  });
}


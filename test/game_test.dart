import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_hafiza_dizisi/oyun_hafiza_dizisi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(hafizaDizisiConfig.title.length, 33);
    expect(hafizaDizisiConfig.tagline.length, 33);
    for (final s in hafizaDizisiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(hafizaDizisiConfig.gameId, hafizaDizisiId);
    expect(hafizaDizisiRules.gameId, hafizaDizisiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(hafizaDizisiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: hafizaDizisiId, optionalMechanics: hafizaDizisiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(hafizaDizisiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}

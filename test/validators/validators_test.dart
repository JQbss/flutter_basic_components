import 'package:flutter/material.dart';
import 'package:flutter_basic_components/utils/validators.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class BuildContextTest extends Mock implements BuildContext{}
class MockTest extends Mock implements Validators{
  nameValidation(String? email, BuildContext context);
}

main() async {

  late BuildContextTest contextTest;
  final mockTest = MockTest();

  setUpAll((){
    contextTest = BuildContextTest();
  });

  group('Test validators', (){
    test('Validate address email', (){
      when(mockTest.nameValidation(null,contextTest)).thenAnswer((_) {
        return "Empty";
      });
      when(mockTest.nameValidation("",contextTest)).thenAnswer((_) {
        return "Empty";
      });

      expect("Empty",mockTest.nameValidation(null,contextTest));
      expect("Empty",mockTest.nameValidation("",contextTest));
      expect(null,mockTest.nameValidation("test@wp.pl",contextTest));
    });
  });
}

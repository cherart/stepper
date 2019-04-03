import 'package:stepper/auth/validator.dart';
import 'package:test_api/test_api.dart';

void main() {

  test('empty email returns error', () {
    String value = Validator.validateEmail('');
    expect(value, 'Enter valid email');
  });

  test('email 0 chars before @ returns error', () {
    String value = Validator.validateEmail('@gmail.com');
    expect(value, 'Enter valid email');
  });

//  test('email 65 chars before @ returns error', () {
//    String value = Validator.validateEmail('asdhagsdhjasgdajhsgdahjsdgasjhdgahjsdgahjsdgqweqoweuyqowyue123456@gmail.com');
//    expect(value, 'Enter valid email');
//  });

  test('email 64 chars before @ returns null', () {
    String value = Validator.validateEmail('asdhagsdhjasgdajhsgdahjsdgasjhdgahjsdgahjsdgqweqoweuyqowyue12345@gmail.com');
    expect(value, null);
  });

  test('empty password returns error', () {
    String value = Validator.validatePassword('');
    expect(value, 'Password minimum 6 characters');
  });

  test('password 5 characters returns error', () {
    String value = Validator.validatePassword('cherk');
    expect(value, 'Password minimum 6 characters');
  });

  test('password contains space returns error', () {
    String value = Validator.validatePassword('cherk a');
    expect(value, "Password can't contain spaces");
  });

  test('empty name returns name minimum 5 characters', () {
    String value = Validator.validateName('');
    expect(value, 'Name minimum 5 characters');
  });

  test('name 4 characters returns error', () {
    String value = Validator.validateName('1234');
    expect(value, 'Name minimum 5 characters');
  });

  test('name 4 spaces characters returns error', () {
    String value = Validator.validateName('    ');
    expect(value, 'Name minimum 5 characters');
  });

  test('name 5 spaces characters returns error', () {
    String value = Validator.validateName('     ');
    expect(value, 'Name can\'t consist only of spaces');
  });
}

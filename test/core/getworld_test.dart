import 'package:flutter_test/flutter_test.dart';
import 'package:getworld/getworld.dart';

void main() {
  test('get world', () async {
    Stopwatch stopwatch = Stopwatch()..start();

    GetWorld().initialize();
    print(Countries.length);
    print(Languages.length);
    print(Currencies.length);

    print(
        'GetWorld.intitialize executed in ${stopwatch.elapsed.inMilliseconds} Milliseconds\n');

    print(Countries.firstWhere(
        (element) => element.name.common.toLowerCase().contains('jordan')));
    //Find by common/offical name
    stopwatch.reset();
    Countries.firstWhere(
            (element) => element.name.common.toLowerCase().contains('jordan'))
        .provinces!
        .firstWhere((element) => element.name == "Zarqa")
        .cities!
        .forEach((element) {
      print(element.name);
    });
    // print(
    //     'Countries.where executed  in ${stopwatch.elapsed.inMilliseconds} Milliseconds\n');

    // //Find by calling_code
    // stopwatch.reset();
    // print(Countries.where(
    //         (country) => country.dialling!.calling_code.contains("+1"))
    //     .map((e) => e.name.common));
    // print(
    //     'Countries.where executed  in ${stopwatch.elapsed.inMilliseconds} Milliseconds\n');

    // //Find by Currency object
    // stopwatch.reset();
    // print(Countries.where((country) => country.currencies!.contains(
    //         Currencies.firstWhere((cur) => cur.iso_4217_code == "USD")))
    //     .map((e) => e.name.common));
    // print(
    //     'Countries.where executed  in ${stopwatch.elapsed.inMilliseconds} Milliseconds\n');

    // //Find by Currency code
    // stopwatch.reset();
    // print(Countries.where((country) => country.currencies!
    //         .any((currency) => currency.iso_4217_code == "USD"))
    //     .map((e) => e.name.common));
    // print(
    //     'Countries.where executed  in ${stopwatch.elapsed.inMilliseconds} Milliseconds\n');
  });
}

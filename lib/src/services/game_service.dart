import 'dart:math';

import 'package:neurosnake/src/models/direction.dart';
import 'package:neurosnake/src/models/input_condition.dart';
import 'package:neurosnake/src/utils/calc_helper.dart';
import 'package:perceptron/perceptron.dart';

class GameService {

  static const jsonData = '{"netConfiguration":[8,10,4],"activationFunction":"sigmoid","synapses":[{"layer":0,"origin":0,"destination":0,"weight":-2.856667523158452},{"layer":0,"origin":0,"destination":1,"weight":0.6140454825309313},{"layer":0,"origin":0,"destination":2,"weight":-17.41266187103688},{"layer":0,"origin":0,"destination":3,"weight":4.83650029775406},{"layer":0,"origin":0,"destination":4,"weight":-10.202403565269854},{"layer":0,"origin":0,"destination":5,"weight":-1.6882074261517452},{"layer":0,"origin":0,"destination":6,"weight":-2.2449054400687545},{"layer":0,"origin":0,"destination":7,"weight":-0.8052350616247449},{"layer":0,"origin":0,"destination":8,"weight":-23.526579519408855},{"layer":0,"origin":0,"destination":9,"weight":9.377547098018738},{"layer":0,"origin":1,"destination":0,"weight":11.97600713913978},{"layer":0,"origin":1,"destination":1,"weight":-1.145797725505079},{"layer":0,"origin":1,"destination":2,"weight":-0.3849187360205587},{"layer":0,"origin":1,"destination":3,"weight":4.305188024391064},{"layer":0,"origin":1,"destination":4,"weight":-0.34124656072287635},{"layer":0,"origin":1,"destination":5,"weight":2.078332376456456},{"layer":0,"origin":1,"destination":6,"weight":-7.359725128581983},{"layer":0,"origin":1,"destination":7,"weight":2.504747230745567},{"layer":0,"origin":1,"destination":8,"weight":7.258178741633862},{"layer":0,"origin":1,"destination":9,"weight":-29.817144237854894},{"layer":0,"origin":2,"destination":0,"weight":-11.889666248418152},{"layer":0,"origin":2,"destination":1,"weight":-12.205323311556986},{"layer":0,"origin":2,"destination":2,"weight":-1.1214921300554948},{"layer":0,"origin":2,"destination":3,"weight":-10.752418884111004},{"layer":0,"origin":2,"destination":4,"weight":-1.2585868615364315},{"layer":0,"origin":2,"destination":5,"weight":-11.795400351566004},{"layer":0,"origin":2,"destination":6,"weight":-4.1340572596824305},{"layer":0,"origin":2,"destination":7,"weight":5.454544235991095},{"layer":0,"origin":2,"destination":8,"weight":7.028436761192779},{"layer":0,"origin":2,"destination":9,"weight":-0.1510974881033568},{"layer":0,"origin":3,"destination":0,"weight":2.0520620113355363},{"layer":0,"origin":3,"destination":1,"weight":0.91274597930512},{"layer":0,"origin":3,"destination":2,"weight":7.297511073274349},{"layer":0,"origin":3,"destination":3,"weight":1.5623864719343092},{"layer":0,"origin":3,"destination":4,"weight":0.1323761460506402},{"layer":0,"origin":3,"destination":5,"weight":0.389013081660204},{"layer":0,"origin":3,"destination":6,"weight":0.06094263745971876},{"layer":0,"origin":3,"destination":7,"weight":-15.786681827894244},{"layer":0,"origin":3,"destination":8,"weight":6.315309305114257},{"layer":0,"origin":3,"destination":9,"weight":6.136732925363178},{"layer":0,"origin":4,"destination":0,"weight":-0.6911331569512187},{"layer":0,"origin":4,"destination":1,"weight":-6.827949678633116},{"layer":0,"origin":4,"destination":2,"weight":9.803605278018438},{"layer":0,"origin":4,"destination":3,"weight":0.44498518355467326},{"layer":0,"origin":4,"destination":4,"weight":8.514022952382419},{"layer":0,"origin":4,"destination":5,"weight":-3.6324581477902744},{"layer":0,"origin":4,"destination":6,"weight":-2.6686348657425856},{"layer":0,"origin":4,"destination":7,"weight":0.03638511200328367},{"layer":0,"origin":4,"destination":8,"weight":4.8765848450200275},{"layer":0,"origin":4,"destination":9,"weight":-1.0013697965833739},{"layer":0,"origin":5,"destination":0,"weight":-3.3020850434700773},{"layer":0,"origin":5,"destination":1,"weight":-9.431591762349617},{"layer":0,"origin":5,"destination":2,"weight":-6.2461284706406826},{"layer":0,"origin":5,"destination":3,"weight":-2.403375253724128},{"layer":0,"origin":5,"destination":4,"weight":-1.1911335727397914},{"layer":0,"origin":5,"destination":5,"weight":-3.568279024665606},{"layer":0,"origin":5,"destination":6,"weight":7.648957933290128},{"layer":0,"origin":5,"destination":7,"weight":-10.269859176231074},{"layer":0,"origin":5,"destination":8,"weight":-3.65407151914955},{"layer":0,"origin":5,"destination":9,"weight":6.5130427955848225},{"layer":0,"origin":6,"destination":0,"weight":1.0919819575890137},{"layer":0,"origin":6,"destination":1,"weight":8.810508696263888},{"layer":0,"origin":6,"destination":2,"weight":-1.4199148349256139},{"layer":0,"origin":6,"destination":3,"weight":3.9267666985912335},{"layer":0,"origin":6,"destination":4,"weight":-8.74639524151086},{"layer":0,"origin":6,"destination":5,"weight":6.8828274859682335},{"layer":0,"origin":6,"destination":6,"weight":3.889127291587607},{"layer":0,"origin":6,"destination":7,"weight":-5.089315488702837},{"layer":0,"origin":6,"destination":8,"weight":-3.7641064075797424},{"layer":0,"origin":6,"destination":9,"weight":-1.7946421096496707},{"layer":0,"origin":7,"destination":0,"weight":-0.11663630530969236},{"layer":0,"origin":7,"destination":1,"weight":1.4929004025508437},{"layer":0,"origin":7,"destination":2,"weight":-1.4081879472204542},{"layer":0,"origin":7,"destination":3,"weight":-3.231365377703745},{"layer":0,"origin":7,"destination":4,"weight":-1.1023557366848777},{"layer":0,"origin":7,"destination":5,"weight":-0.8293953705723677},{"layer":0,"origin":7,"destination":6,"weight":-1.5083287432750778},{"layer":0,"origin":7,"destination":7,"weight":10.255051423937909},{"layer":0,"origin":7,"destination":8,"weight":1.3934107206026476},{"layer":0,"origin":7,"destination":9,"weight":-7.482845498875189},{"layer":0,"origin":8,"destination":0,"weight":-0.7197546039394277},{"layer":0,"origin":8,"destination":1,"weight":-6.313858631989207},{"layer":0,"origin":8,"destination":2,"weight":-2.130518740262748},{"layer":0,"origin":8,"destination":3,"weight":-4.975173383903068},{"layer":0,"origin":8,"destination":4,"weight":-2.5952870873772795},{"layer":0,"origin":8,"destination":5,"weight":-3.718125210247499},{"layer":0,"origin":8,"destination":6,"weight":-2.287785505204315},{"layer":0,"origin":8,"destination":7,"weight":-7.319961782178712},{"layer":0,"origin":8,"destination":8,"weight":0.9522377704051531},{"layer":0,"origin":8,"destination":9,"weight":-2.7226637448545348},{"layer":1,"origin":0,"destination":0,"weight":-0.928472500810503},{"layer":1,"origin":0,"destination":1,"weight":-3.738275668218135},{"layer":1,"origin":0,"destination":2,"weight":7.77017362619316},{"layer":1,"origin":0,"destination":3,"weight":-4.844931284662055},{"layer":1,"origin":1,"destination":0,"weight":-5.726323429073047},{"layer":1,"origin":1,"destination":1,"weight":-11.105886746902764},{"layer":1,"origin":1,"destination":2,"weight":11.100971015064808},{"layer":1,"origin":1,"destination":3,"weight":-5.785844553625096},{"layer":1,"origin":2,"destination":0,"weight":4.737346913705678},{"layer":1,"origin":2,"destination":1,"weight":-5.271130134315059},{"layer":1,"origin":2,"destination":2,"weight":-3.675056650975361},{"layer":1,"origin":2,"destination":3,"weight":-7.4138472523502035},{"layer":1,"origin":3,"destination":0,"weight":-3.5757759300727145},{"layer":1,"origin":3,"destination":1,"weight":-1.208837457793752},{"layer":1,"origin":3,"destination":2,"weight":4.5835299187501475},{"layer":1,"origin":3,"destination":3,"weight":-6.320169137120331},{"layer":1,"origin":4,"destination":0,"weight":10.371505244692067},{"layer":1,"origin":4,"destination":1,"weight":-8.909870670224562},{"layer":1,"origin":4,"destination":2,"weight":-4.307923860577613},{"layer":1,"origin":4,"destination":3,"weight":-8.572633185969519},{"layer":1,"origin":5,"destination":0,"weight":-7.932496434352514},{"layer":1,"origin":5,"destination":1,"weight":-1.0715177606537907},{"layer":1,"origin":5,"destination":2,"weight":5.749769904444193},{"layer":1,"origin":5,"destination":3,"weight":-2.502166882270449},{"layer":1,"origin":6,"destination":0,"weight":-4.828660122244477},{"layer":1,"origin":6,"destination":1,"weight":4.602831041922845},{"layer":1,"origin":6,"destination":2,"weight":1.251117998306024},{"layer":1,"origin":6,"destination":3,"weight":-3.0256194035701363},{"layer":1,"origin":7,"destination":0,"weight":-12.154551962362191},{"layer":1,"origin":7,"destination":1,"weight":-4.475208475387408},{"layer":1,"origin":7,"destination":2,"weight":-10.997585741196698},{"layer":1,"origin":7,"destination":3,"weight":14.158437670304028},{"layer":1,"origin":8,"destination":0,"weight":11.579290490246608},{"layer":1,"origin":8,"destination":1,"weight":-4.674148731153022},{"layer":1,"origin":8,"destination":2,"weight":-6.235842547990416},{"layer":1,"origin":8,"destination":3,"weight":-9.71438278759844},{"layer":1,"origin":9,"destination":0,"weight":-7.370787633551715},{"layer":1,"origin":9,"destination":1,"weight":12.303867694773123},{"layer":1,"origin":9,"destination":2,"weight":-6.392738501029035},{"layer":1,"origin":9,"destination":3,"weight":-11.458418020202119},{"layer":1,"origin":10,"destination":0,"weight":-7.688106255223809},{"layer":1,"origin":10,"destination":1,"weight":-7.673589319973611},{"layer":1,"origin":10,"destination":2,"weight":-8.423685826693859},{"layer":1,"origin":10,"destination":3,"weight":7.071160509584693}]}';

  final perceptron = Perceptron.fromJson(jsonData, 10);

  //final perceptron = Perceptron([5, 16, 4]);

  Direction getDirection(InputCondition input) {
    final result = perceptron.process(convertInputConditionToArray(input));
    //print('${convertInputConditionToArray(input)}, $result');
    final maxValue = result.reduce(max);
    if (maxValue == result[0]) {
      return Direction.up;
    }
    if (maxValue == result[1]) {
      return Direction.right;
    }
    if (maxValue == result[2]) {
      return Direction.down;
    }
    return Direction.left;
  }

  void trainNetwork(List<InputCondition> inputs, List<Direction> outputs) {
    final data = <TrainingData>[];
    for (var i = 0; i< inputs.length; i++) {
      final inputArray = convertInputConditionToArray(inputs[i]);
      final outputArray = convertDirectionToOutputArray(outputs[i]);
      data.add(TrainingData(inputArray, outputArray));
    }
    print('Got ${data.length} records for training');
//    for (var i=0; i<20; i++) {
      perceptron.train(data);
//    }
    print('network trained');
    print(perceptron.toJson());
  }
}
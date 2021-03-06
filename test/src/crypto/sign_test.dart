import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:kadena/kadena.dart';
import 'package:test/test.dart';

void main() {
  test('signHash', () {
    final keyPair = KeyPair.fromSeed(hex.decode(
        '8693e641ae2bbe9ea802c736f42027b03f86afe63cae315e7169c9c496c17332'));
    final result = signHash(
        base64.fixPadding('uolsidh4DWN-D44FoElnosL8e5-cGCGn_0l2Nct5mq8'),
        keyPair);
    expect(result.hashWithoutPadding,
        'uolsidh4DWN-D44FoElnosL8e5-cGCGn_0l2Nct5mq8');
    expect(result.sig,
        '4b0ecfbb0e8f3cb291b57abd27028ceaa221950affa39f10efbf4a5fe740d32670e94c3d3949a7e5f4f6ea692052ca110f7cb2e9a8ee2c5eff4251ed84bbfa03');
    expect(result.pubKey,
        'ba54b224d1924dd98403f5c751abdd10de6cd81b0121800bf7bdbdcfaec7388d');
  });

  test('sign', () {
    final keyPair = KeyPair.fromSeed(hex.decode(
        '8693e641ae2bbe9ea802c736f42027b03f86afe63cae315e7169c9c496c17332'));
    final nonce = 'step01';
    final pactCode =
        "(define-keyset 'k (read-keyset \"accounts-admin-keyset\"))\n(module system \'k\n  (defun get-system-time ()\n    (time \"2017-10-31T12:00:00Z\")))\n(get-system-time)";
    final envData = {
      'accounts-admin-keyset': [
        'ba54b224d1924dd98403f5c751abdd10de6cd81b0121800bf7bdbdcfaec7388d'
      ]
    };
    final command = {
      'networkId': null,
      'payload': {
        'exec': {'data': envData, 'code': pactCode}
      },
      'signers': [
        {
          'pubKey':
              'ba54b224d1924dd98403f5c751abdd10de6cd81b0121800bf7bdbdcfaec7388d'
        }
      ],
      'meta': {
        'creationTime': 0,
        'ttl': 0,
        'gasLimit': 0,
        'chainId': '',
        'gasPrice': 0,
        'sender': ''
      },
      'nonce': json.encode(nonce),
    };
    final result = sign(json.encode(command), keyPair);
    expect(result.hashWithoutPadding,
        'uolsidh4DWN-D44FoElnosL8e5-cGCGn_0l2Nct5mq8');
    expect(result.sig,
        '4b0ecfbb0e8f3cb291b57abd27028ceaa221950affa39f10efbf4a5fe740d32670e94c3d3949a7e5f4f6ea692052ca110f7cb2e9a8ee2c5eff4251ed84bbfa03');
    expect(result.pubKey,
        'ba54b224d1924dd98403f5c751abdd10de6cd81b0121800bf7bdbdcfaec7388d');
  });
}

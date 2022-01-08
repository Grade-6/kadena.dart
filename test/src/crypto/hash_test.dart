import 'dart:convert';

import 'package:kadena/kadena.dart';
import 'package:test/test.dart';

void main() {
  test('hash', () {
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
    final result = hash(json.encode(command));
    expect(result, 'uolsidh4DWN-D44FoElnosL8e5-cGCGn_0l2Nct5mq8');
  });
}

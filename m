Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TYpIZ-0006Jn-NK
	for mharc-qemu-trivial@gnu.org; Wed, 14 Nov 2012 21:35:23 -0500
Received: from eggs.gnu.org ([208.118.235.92]:37925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericj@mips.com>) id 1TYpIV-0006IU-EA
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 21:35:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ericj@mips.com>) id 1TYpIS-0006Zc-BX
	for qemu-trivial@nongnu.org; Wed, 14 Nov 2012 21:35:19 -0500
Received: from dns1.mips.com ([12.201.5.69]:53100)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericj@mips.com>)
	id 1TYpIR-0006ZJ-RO; Wed, 14 Nov 2012 21:35:16 -0500
Received: from mailgate1.mips.com (mailgate1.mips.com [12.201.5.111])
	by dns1.mips.com (8.13.8/8.13.8) with ESMTP id qAF2Yc0G009554;
	Wed, 14 Nov 2012 18:34:38 -0800
X-WSS-ID: 0MDICHQ-01-06Q-02
X-M-MSG: 
Received: from exchdb01.mips.com (unknown [192.168.36.84])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mailgate1.mips.com (Postfix) with ESMTP id 288BE364671;
	Wed, 14 Nov 2012 18:34:37 -0800 (PST)
Received: from EXCHDB03.MIPS.com ([fe80::6df1:ae84:797e:9076]) by
	exchhub01.mips.com ([::1]) with mapi id 14.01.0270.001; Wed, 14 Nov 2012
	18:34:33 -0800
From: "Johnson, Eric" <ericj@mips.com>
To: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
	<qemu-trivial@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH] target-mips: Clean up microMIPS32 major
	opcode
Thread-Index: AQHNwtcTq/nEklNa4UOtkqHliN5GTJfqK3fw
Date: Thu, 15 Nov 2012 02:34:31 +0000
Message-ID: <AD431C1EF67D4B4B801AEC089EB7ED48014488ABEC@exchdb03.mips.com>
References: <20121115021501.GA15630@cs.nctu.edu.tw>
In-Reply-To: <20121115021501.GA15630@cs.nctu.edu.tw>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.16.149]
x-ems-proccessed: 6LP3oGfGVdcdb8o1aBnt6w==
x-ems-stamp: wJi0Z9IGzu1bBMdI07qeAQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 12.201.5.69
Cc: "chenwj@cs.nctu.edu.tw" <chenwj@cs.nctu.edu.tw>, Jia Liu <proljc@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-mips: Clean up
 microMIPS32 major opcode
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Nov 2012 02:35:22 -0000

SGkgQ2hlbiwNCg0KUGxlYXNlIG9ubHkgcmVtb3ZlIHRoZSBQT09MNDhBIG9wY29kZS4NCg0KVGhl
IG90aGVycyBhcmUgZG9jdW1lbnRlZCBpbiB0aGUgbWljcm9NSVBTNjQgSW5zdHJ1Y3Rpb24gU2V0
IG1hbnVhbCAoIGh0dHA6Ly93d3cubWlwcy5jb20vc2VjdXJlLWRvd25sb2FkL2luZGV4LmRvdD9w
cm9kdWN0X25hbWU9L2F1dGgvTUQwMDA4Ny0yQi1NSVBTNjRCSVMtQUZQLTAzLjUxLnBkZiApLiAg
U2VlIGh0dHA6Ly93d3cubWlwcy5jb20vcHJvZHVjdHMvYXJjaGl0ZWN0dXJlcy9taXBzNjQvIGZv
ciBvdGhlciByZWxhdmVudCBkb2NzLg0KDQpJbnN0ZWFkIG9mIHJlbW92aW5nIHRoZW0gcGxlYXNl
IHN1cnJvdW5kIHRoZSBQT09MMzJTLCBEQURESVUzMiwgU0QzMiwgYW5kIExEMzIgb3Bjb2RlcyB3
aXRoDQojaWYgZGVmaW5lZChUQVJHRVRfTUlQUzY0KQ0KDQotRXJpYw0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IHFlbXUtZGV2ZWwtYm91bmNlcytlcmljaj1taXBzLmNv
bUBub25nbnUub3JnIFttYWlsdG86cWVtdS1kZXZlbC0NCj4gYm91bmNlcytlcmljaj1taXBzLmNv
bUBub25nbnUub3JnXSBPbiBCZWhhbGYgT2YgPz8/IChXZWktUmVuIENoZW4pDQo+IFNlbnQ6IFdl
ZG5lc2RheSwgTm92ZW1iZXIgMTQsIDIwMTIgNjoxNSBQTQ0KPiBUbzogcWVtdS1kZXZlbEBub25n
bnUub3JnOyBxZW11LXRyaXZpYWxAbm9uZ251Lm9yZw0KPiBDYzogY2hlbndqQGNzLm5jdHUuZWR1
LnR3OyBKaWEgTGl1OyBBdXJlbGllbiBKYXJubw0KPiBTdWJqZWN0OiBbUWVtdS1kZXZlbF0gW1BB
VENIXSB0YXJnZXQtbWlwczogQ2xlYW4gdXAgbWljcm9NSVBTMzIgbWFqb3INCj4gb3Bjb2RlDQo+
IA0KPiBIaSBhbGwsDQo+IA0KPiAgIEkgY2hlY2sgTUlQUyBtaWNyb01JUFMgbWFudWFsIFsxXSwg
YW5kIGZvdW5kIHRoZSBtYWpvciBvcGNvZGUgbWlnaHQgYmUNCj4gd3JvbmcuIEkgYWRkIGEgY29t
bWVudCB0byBleHBsaWNpdGx5IGluZGljYXRlIHdoYXQgbWFudWFsIEkgYW0gcmVmZXJpbmcNCj4g
dG8sIGFuZCBhY2NvcmRpbmcgdGhhdCBtYW51YWwgSSByZW1vdmUgc29tZSBtaWNyb01JUFMzMiBt
YWpvciBvcGNvZGVzLg0KPiBNYWpvciBvcGNvZGUgMHgxZiBpcyByZXNlcnZlZCwgc28gSSBqdXN0
IHJlbW92ZSBpdC4gQXMgZm9yIG90aGVycywgbGlrZQ0KPiAweDE2LCAweDE3LCAweDM2IGFuZCAw
eDM3LCB0aGV5IGFyZSBmb3IgaGlnaGVyLW9yZGVyIE1JUFMgSVNBIGxldmVsIG9yDQo+IG5ldyBy
ZXZpc2lvbiBvZiB0aGlzIG1pY3JvTUlQUyBhcmNoaXRlY3R1cmUuIFNpbmNlIHRoZXkgYXJlIG5v
dCBhcHBlYXINCj4gaW4gdGhlIG1hbnVhbCBJIHJlZmVyIHRvLCBJIGp1c3QgcmVtb3ZlIHRoZW0g
YXMgd2VsbC4NCj4gDQo+ICAgUGxlYXNlIHJldmlldywgdGhhbmtzLg0KPiANCj4gWzFdIGh0dHA6
Ly93d3cubWlwcy5jb20vcHJvZHVjdHMvYXJjaGl0ZWN0dXJlcy9taWNyb21pcHMvI3NwZWNpZmlj
YXRpb25zDQo+IA0KPiAgICAgTUlQUyBBcmNoaXRlY3R1cmUgZm9yIFByb2dyYW1tZXJzIFZvbHVt
ZSBJSS1COg0KPiAgICAgICBUaGUgbWljcm9NSVBTMzIgSW5zdHJ1Y3Rpb24gU2V0IChSZXZpc2lv
biAzLjA1KQ0KPiANCj4gICAgIE1EMDA1ODItMkItbWljcm9NSVBTLUFGUC0wMy4wNS5wZGYNCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IENoZW4gV2VpLVJlbiA8Y2hlbndqQGlpcy5zaW5pY2EuZWR1LnR3
Pg0KPiAtLS0NCj4gIHRhcmdldC1taXBzL3RyYW5zbGF0ZS5jIHwgICAxNiArKysrKysrKysrLS0t
LS0tDQo+ICAxIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0LW1pcHMvdHJhbnNsYXRlLmMgYi90YXJnZXQtbWlw
cy90cmFuc2xhdGUuYw0KPiBpbmRleCBmNmZjMGMyLi5iNTdkYTI0IDEwMDY0NA0KPiAtLS0gYS90
YXJnZXQtbWlwcy90cmFuc2xhdGUuYw0KPiArKysgYi90YXJnZXQtbWlwcy90cmFuc2xhdGUuYw0K
PiBAQCAtMTAyNDEsNyArMTAyNDEsMTUgQEAgc3RhdGljIGludCBkZWNvZGVfbWlwczE2X29wYyAo
Q1BVTUlQU1N0YXRlICplbnYsDQo+IERpc2FzQ29udGV4dCAqY3R4LA0KPiANCj4gIC8qIG1pY3Jv
TUlQUyBleHRlbnNpb24gdG8gTUlQUzMyICovDQo+IA0KPiAtLyogbWljcm9NSVBTMzIgbWFqb3Ig
b3Bjb2RlcyAqLw0KPiArLyoNCj4gKyAqIG1pY3JvTUlQUzMyIG1ham9yIG9wY29kZXMNCj4gKyAq
DQo+ICsgKiBNSVBTIEFyY2hpdGVjdHVyZSBmb3IgUHJvZ3JhbW1lcnMgVm9sdW1lIElJLUI6DQo+
ICsgKiAgIFRoZSBtaWNyb01JUFMzMiBJbnN0cnVjdGlvbiBTZXQgKFJldmlzaW9uIDMuMDUpDQo+
ICsgKg0KPiArICogVGFibGUgNi4yIG1pY3JvTUlQUzMyIEVuY29kaW5nIG9mIE1ham9yIE9wY29k
ZSBGaWVsZA0KPiArICoNCj4gKyAqLw0KPiANCj4gIGVudW0gew0KPiAgICAgIFBPT0wzMkEgPSAw
eDAwLA0KPiBAQCAtMTAyNjgsOSArMTAyNzYsOCBAQCBlbnVtIHsNCj4gICAgICBQT09MMTZEID0g
MHgxMywNCj4gICAgICBPUkkzMiA9IDB4MTQsDQo+ICAgICAgUE9PTDMyRiA9IDB4MTUsDQo+IC0g
ICAgUE9PTDMyUyA9IDB4MTYsDQo+IC0gICAgREFERElVMzIgPSAweDE3LA0KPiANCj4gKyAgICAv
KiAweDFmIGlzIHJlc2VydmVkICovDQo+ICAgICAgUE9PTDMyQyA9IDB4MTgsDQo+ICAgICAgTFdH
UDE2ID0gMHgxOSwNCj4gICAgICBMVzE2ID0gMHgxYSwNCj4gQEAgLTEwMjc4LDcgKzEwMjg1LDYg
QEAgZW51bSB7DQo+ICAgICAgWE9SSTMyID0gMHgxYywNCj4gICAgICBKQUxTMzIgPSAweDFkLA0K
PiAgICAgIEFERElVUEMgPSAweDFlLA0KPiAtICAgIFBPT0w0OEEgPSAweDFmLA0KPiANCj4gICAg
ICAvKiAweDIwIGlzIHJlc2VydmVkICovDQo+ICAgICAgUkVTXzIwID0gMHgyMCwNCj4gQEAgLTEw
MzA3LDggKzEwMzEzLDYgQEAgZW51bSB7DQo+ICAgICAgQjE2ID0gMHgzMywNCj4gICAgICBBTkRJ
MzIgPSAweDM0LA0KPiAgICAgIEozMiA9IDB4MzUsDQo+IC0gICAgU0QzMiA9IDB4MzYsDQo+IC0g
ICAgTEQzMiA9IDB4MzcsDQo+IA0KPiAgICAgIC8qIDB4MzggYW5kIDB4MzkgYXJlIHJlc2VydmVk
ICovDQo+ICAgICAgUkVTXzM4ID0gMHgzOCwNCj4gLS0NCj4gMS43LjMuNA0KDQo=


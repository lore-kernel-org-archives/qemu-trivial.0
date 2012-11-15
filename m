Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TZ3H1-0006uB-Fa
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2012 12:30:43 -0500
Received: from eggs.gnu.org ([208.118.235.92]:56405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericj@mips.com>) id 1TZ3Gw-0006tu-Uw
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 12:30:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ericj@mips.com>) id 1TZ3Gt-0004tE-TF
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2012 12:30:38 -0500
Received: from dns1.mips.com ([12.201.5.69]:55563)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ericj@mips.com>)
	id 1TZ3Gt-0004t2-KS; Thu, 15 Nov 2012 12:30:35 -0500
Received: from mailgate1.mips.com (mailgate1.mips.com [12.201.5.111])
	by dns1.mips.com (8.13.8/8.13.8) with ESMTP id qAFHUBO8025654;
	Thu, 15 Nov 2012 09:30:11 -0800
X-WSS-ID: 0MDJHYA-01-0PF-02
X-M-MSG: 
Received: from exchdb01.mips.com (unknown [192.168.36.84])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mailgate1.mips.com (Postfix) with ESMTP id 2BF3936464F;
	Thu, 15 Nov 2012 09:30:10 -0800 (PST)
Received: from EXCHDB03.MIPS.com ([fe80::6df1:ae84:797e:9076]) by
	exchhub01.mips.com ([::1]) with mapi id 14.01.0270.001; Thu, 15 Nov 2012
	09:30:06 -0800
From: "Johnson, Eric" <ericj@mips.com>
To: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Thread-Topic: [Qemu-devel] [PATCH] target-mips: Clean up microMIPS32 major
	opcode
Thread-Index: AQHNwtcTq/nEklNa4UOtkqHliN5GTJfqK3fwgACXEgD//4OUdoAApMUAgAA7gwA=
Date: Thu, 15 Nov 2012 17:30:05 +0000
Message-ID: <AD431C1EF67D4B4B801AEC089EB7ED48014488B35D@exchdb03.mips.com>
References: <20121115021501.GA15630@cs.nctu.edu.tw>
	<AD431C1EF67D4B4B801AEC089EB7ED48014488ABEC@exchdb03.mips.com>
	<20121115032652.GA17050@cs.nctu.edu.tw>
	<FD6A7462-2EB5-4527-B56C-FDC5DD3A59AD@mips.com>
	<20121115055116.GA20526@cs.nctu.edu.tw>
In-Reply-To: <20121115055116.GA20526@cs.nctu.edu.tw>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.16.149]
x-ems-proccessed: 6LP3oGfGVdcdb8o1aBnt6w==
x-ems-stamp: ZfmSklBfLPV6CQ2mQsix5w==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 12.201.5.69
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Jia Liu <proljc@gmail.com>
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
X-List-Received-Date: Thu, 15 Nov 2012 17:30:42 -0000

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiDpmbPpn4vku7sgKFdlaS1SZW4g
Q2hlbikgW21haWx0bzpjaGVud2pAaWlzLnNpbmljYS5lZHUudHddDQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgTm92ZW1iZXIgMTQsIDIwMTIgOTo1MSBQTQ0KPiBUbzogSm9obnNvbiwgRXJpYw0KPiBDYzog
cWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LXRyaXZpYWxAbm9uZ251Lm9yZzsgSmlhIExpdTsg
QXVyZWxpZW4NCj4gSmFybm8NCj4gU3ViamVjdDogUmU6IFtRZW11LWRldmVsXSBbUEFUQ0hdIHRh
cmdldC1taXBzOiBDbGVhbiB1cCBtaWNyb01JUFMzMiBtYWpvcg0KPiBvcGNvZGUNCj4gDQo+IE9u
IFRodSwgTm92IDE1LCAyMDEyIGF0IDA0OjAxOjMyQU0gKzAwMDAsIEpvaG5zb24sIEVyaWMgd3Jv
dGU6DQo+ID4gSGkgQ2hlbiwNCj4gPg0KPiA+IFNvcnJ5IEkgbXVzdCBoYXZlIG1hZGUgYSBjb3B5
IHBhc3RlIGVycm9yLiAgSSBhY2Nlc3MgdGhlIGRvY3VtZW50cw0KPiBpbnRlcm5hbGx5LiBJJ2xs
IGRvdWJsZSBjaGVjayB0aGUgbGluayB0b21vcnJvdy4NCj4gPg0KPiA+IFRoZSBkb2N1bWVudCBJ
IHJlZmVyZW5jZWQgaXMgdGhlIE1JUFM2NCBub3QgdGhlIG1pY3JvTUlQUzY0Lg0KPiA+DQo+ID4g
RG8gbm90IGNoYW5nZSB0aGUgbmFtZXMuIFRoZSBMRDMyIGFuZCBTRDMyIGFyZSBtaWNyb01JUFMg
c3BlY2lmaWMuIFRoZQ0KPiBhc3NlbWJsZXIgTEQgYW5kIFNEIG9wY29kZXMgd29yayBmb3IgZWl0
aGVyIE1JUFM2NCBvciBtaWNyb01JUFM2NC4NCj4gDQo+ICAgTy5LLiwgdGhhbmtzIGZvciB0aGUg
aGVscC4gOikNCj4gDQo+ICAgSG93IGFib3V0IERBRERJVTMyLCBzaG91bGQgSSBrZWVwIHRoZSAz
MiBzdWZmaXgsIHRvbz8NCj4gSSBzdGlsbCBjYW4ndCBmaW5kIHdoZXJlIFBPT0wzMlMgaXMuDQo+
IA0KPiBSZWdhcmRzLA0KPiBjaGVud2oNCg0KVGhlIG9ubHkgb3Bjb2RlIG9uIHRoZSBsaXN0IHRo
YXQgaXMgaW5jb3JyZWN0IGlzIHRoZSBQT09MNDhBIG9wY29kZS4gIEl0IHNob3VsZCBiZSByZW1v
dmVkLiAgSWYgdGhlIG90aGVycyBhcmUgcmVtb3ZlZCBvciByZW5hbWVkLCBJIG9yIHNvbWVvbmUg
ZWxzZSB3b3VsZCBqdXN0IGhhdmUgdG8gZml4IHRoZW0gYXQgc29tZSBwb2ludCBpbiB0aGUgZnV0
dXJlLg0KDQpJdCBzZWVtcyB0aGUgbWljcm9NSVBTNjQgSW5zdHJ1Y3Rpb24gU2V0IG1hbnVhbCBp
cyBub3Qgb25lIHRoZSBleHRlcm5hbCB3ZWJzaXRlLiAgSSdsbCBhc2sgYWJvdXQgdGhhdC4NCg0K
LUVyaWMNCg0K


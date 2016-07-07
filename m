Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bLEjm-00063X-5j
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jul 2016 15:13:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <awirth@akamai.com>) id 1bLEji-00060d-O3
	for qemu-trivial@nongnu.org; Thu, 07 Jul 2016 15:13:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <awirth@akamai.com>) id 1bLEjg-0001xm-8q
	for qemu-trivial@nongnu.org; Thu, 07 Jul 2016 15:13:21 -0400
Received: from prod-mail-xrelay05.akamai.com ([23.79.238.179]:50577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <awirth@akamai.com>)
	id 1bLEja-0001u8-AJ; Thu, 07 Jul 2016 15:13:14 -0400
Received: from prod-mail-xrelay05.akamai.com (localhost.localdomain
	[127.0.0.1]) by postfix.imss70 (Postfix) with ESMTP id 3FFE8423A43;
	Thu,  7 Jul 2016 19:13:10 +0000 (GMT)
Received: from prod-mail-relay10.akamai.com (prod-mail-relay10.akamai.com
	[172.27.118.251])
	by prod-mail-xrelay05.akamai.com (Postfix) with ESMTP id 27ECE423745;
	Thu,  7 Jul 2016 19:13:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; s=a1;
	t=1467918790; bh=LbEg/tnL/dtcALTmp7uNXoSqDBlTwpnXrNh4LES+S6w=;
	l=8068; h=From:To:CC:Date:References:In-Reply-To:From;
	b=MjemyT4nAIT4rMgKvHWXp9QwgpxYB6Xuo5KNnimBiqu9xvP0jiQKQEXuobgj3Z+Cy
	1edKjWEek3Lg/VVSNIV7bdGiQ7521nnSUG9W/T98ixbrtYFjzEOLOTmIbk82dhON3z
	jclLKArR50S2NsTCM+xfyu4OrTx78PUNZowJYEc8=
Received: from email.msg.corp.akamai.com (ustx2ex-cas3.msg.corp.akamai.com
	[172.27.25.32])
	by prod-mail-relay10.akamai.com (Postfix) with ESMTP id 03D961FCB8;
	Thu,  7 Jul 2016 19:13:10 +0000 (GMT)
Received: from USTX2EX-DAG1MB3.msg.corp.akamai.com (172.27.27.103) by
	ustx2ex-dag1mb2.msg.corp.akamai.com (172.27.27.102) with Microsoft SMTP
	Server (TLS) id 15.0.1130.7; Thu, 7 Jul 2016 14:13:09 -0500
Received: from USTX2EX-DAG1MB3.msg.corp.akamai.com ([172.27.27.103]) by
	ustx2ex-dag1mb3.msg.corp.akamai.com ([172.27.27.103]) with mapi id
	15.00.1130.005; Thu, 7 Jul 2016 14:13:09 -0500
From: "Wirth, Allan" <awirth@akamai.com>
To: Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
	Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Timothy Pearson
	<tpearson@raptorengineering.com>
Thread-Topic: [Qemu-devel] [PATCH] linux-user: fix signal() syscall on x86_64
Thread-Index: AQHR05ALwApKz4zPX0yzVa9Bvxt/LaAD56uAgAE6SgCAABqkgIAAcV0AgAA6wYCAB8ShAIAAA6qA//+9SQCAAESAAP//vgkA
Date: Thu, 7 Jul 2016 19:13:09 +0000
Message-ID: <3D883151-810E-462C-9F2F-2F6C2C7A2037@akamai.com>
References: <92770843-66C8-471B-BA9C-DA46E92817B9@akamai.com>
	<CAFEAcA9VxFBB7BYBWY1gtHeScPkPehoh6SMVY-68UGz6RSFS=g@mail.gmail.com>
	<164e58f5-7dcc-bc9f-286f-98b5de56c1cb@vivier.eu>
	<CAFEAcA9mk9Z=M+tahGE7JBiQ_zidqF1pj=13eLr0GcxHcSis3Q@mail.gmail.com>
	<cc5798cf-4e88-f1e7-f3ca-45482e0822bb@vivier.eu>
	<CAFEAcA976boeHjzyHMr_83cq+uezzBq=SCWePW-9780UAp=kHA@mail.gmail.com>
	<20160707184944.GA30964@beaming.home>
	<a5c0b701-1e1a-198e-359e-f78cf2d97065@vivier.eu>
	<9DF3E0FA-AEF0-479C-891A-B1280DF2808F@akamai.com>
	<3605d35f-bb1a-e1b8-86ca-13e72992011e@vivier.eu>
In-Reply-To: <3605d35f-bb1a-e1b8-86ca-13e72992011e@vivier.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.19.37.68]
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FE7E1416FD1D44E85B62FFAAB1365FF@akamai.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 23.79.238.179
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: fix signal()
 syscall on x86_64
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jul 2016 19:13:24 -0000

DQoNCk9uIDcvNy8xNiwgMzowOSBQTSwgIkxhdXJlbnQgVml2aWVyIiA8bGF1cmVudEB2aXZpZXIu
ZXU+IHdyb3RlOg0KDQo+DQo+DQo+TGUgMDcvMDcvMjAxNiDDoCAyMTowNCwgV2lydGgsIEFsbGFu
IGEgw6ljcml0IDoNCj4+IA0KPj4gDQo+PiBPbiA3LzcvMTYsIDM6MDIgUE0sICJMYXVyZW50IFZp
dmllciIgPGxhdXJlbnRAdml2aWVyLmV1PiB3cm90ZToNCj4+IA0KPj4+DQo+Pj4NCj4+PiBMZSAw
Ny8wNy8yMDE2IMOgIDIwOjQ5LCBSaWt1IFZvaXBpbyBhIMOpY3JpdCA6DQo+Pj4+IE9uIFNhdCwg
SnVsIDAyLCAyMDE2IGF0IDA5OjEyOjA5UE0gKzAxMDAsIFBldGVyIE1heWRlbGwgd3JvdGU6DQo+
Pj4+PiBPbiAyIEp1bHkgMjAxNiBhdCAxNzo0MSwgTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2
aWVyLmV1PiB3cm90ZToNCj4+Pj4+PiBTYWRseSwgdGhpcyBjYW4ndCB3b3JrOg0KPj4+Pj4+DQo+
Pj4+Pj4gc3BhcmMvc3BhcmM2NC9jcmlzIHVzZSBzeXNfc2VsZWN0IGZvciBOUl9zZWxlY3QgQU5E
IE5SX25ld3NlbGVjdC4NCj4+Pj4+DQo+Pj4+Pj4gTm90IHN1cmUgYWxsIGlzIGNvcnJlY3QsIGJ1
dCBpdCdzIHdoYXQgSSd2ZSBmb3VuZDoNCj4+Pj4+Pg0KPj4+Pj4+ICAgICAgICAgICAgIHwgX19O
Ul9zZWxlY3QgICAgfCBfX05SX19uZXdzZWxlY3QNCj4+Pj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4+PiBhcm0gICAgICAgICB8IHN5c19v
bGRfc2VsZWN0IHwgc3lzX3NlbGVjdCAgICAgIHwNCj4+Pj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4+PiBhYXJjaDY0ICAgICB8IHN5c19z
ZWxlY3QgICAgIHwgICAgICAgIC0gICAgICAgIHwNCj4+Pj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4+PiBhbHBoYSAgICAgICB8IHN5c19z
ZWxlY3QgICAgIHwgICAgICAgIC0gICAgICAgIHwNCj4+Pj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4+PiBjcmlzICAgICAgICB8IHN5c19z
ZWxlY3QgICAgIHwgc3lzX3NlbGVjdCAgICAgIHwNCj4+Pj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4+PiBtNjhrICAgICAgICB8IHN5c19v
bGRfc2VsZWN0IHwgc3lzX3NlbGVjdCAgICAgIHwNCj4+Pj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4+PiBtaWNyb2JsYXplICB8IHN5c19v
bGRfc2VsZWN0IHwgc3lzX3NlbGVjdCAgICAgIHwNCj4+Pj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4+PiBtaXBzICAgICAgICB8IHN5c19v
bGRfc2VsZWN0IHwgc3lzX3NlbGVjdCAgICAgIHwNCj4+Pj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4+PiBtaXBzNjQgICAgICB8IHN5c19z
ZWxlY3QgICAgIHwgICAgICAgIC0gICAgICAgIHwNCj4+Pj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4+PiBvcGVucmlzYyAgICB8IHN5c19z
ZWxlY3QgICAgIHwgICAgICAgIC0gICAgICAgIHwNCj4+Pj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4+PiBwcGMgICAgICAgICB8IHN5c19v
bGRfc2VsZWN0IHwgc3lzX3NlbGVjdCAgICAgIHwNCj4+Pj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4+PiBzMzkweCAgICAgICB8IHN5c19z
ZWxlY3QgICAgIHwgICAgICAgIC0gICAgICAgIHwNCj4+Pj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4+PiBzaDQgICAgICAgICB8IHN5c19v
bGRfc2VsZWN0IHwgc3lzX3NlbGVjdCAgICAgIHwNCj4+Pj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4+PiBzcGFyYyAgICAgICB8IHN5c19z
ZWxlY3QgICAgIHwgc3lzX3NlbGVjdCAgICAgIHwNCj4+Pj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4+PiBzcGFyYzY0ICAgICB8IHN5c19z
ZWxlY3QgICAgIHwgc3lzX3NlbGVjdCAgICAgIHwNCj4+Pj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4+PiB0aWxlZ3ggICAgICB8IHN5c19z
ZWxlY3QgICAgIHwgICAgICAgIC0gICAgICAgIHwNCj4+Pj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4+PiB1bmljb3JlMzIgICB8IHN5c19z
ZWxlY3QgICAgIHwgICAgICAgIC0gICAgICAgIHwNCj4+Pj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4+PiB4ODZfNjQgICAgICB8IHN5c19z
ZWxlY3QgICAgIHwgICAgICAgIC0gICAgICAgIHwNCj4+Pj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4+PiBpMzg2ICAgICAgICB8IHN5c19v
bGRfc2VsZWN0IHwgc3lzX3NlbGVjdCAgICAgIHwNCj4+Pj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4+DQo+Pj4+PiBIbW0uIExvb2tpbmcg
YXQgY3VycmVudCBMaW51eCBnaXQgbWFzdGVyLCBJIGdldA0KPj4+Pj4gc2xpZ2h0bHkgZGlmZmVy
ZW50IHJlc3VsdHMuIFRoZSBvbmx5IGFyY2hpdGVjdHVyZXMgd2hpY2gNCj4+Pj4+IGRlZmluZSBf
X0FSQ0hfV0FOVF9TWVNfT0xEX1NFTEVDVCBhcmU6DQo+Pj4+PiAgYXJtLCBtNjhrLCBtbjEwMzAw
LCB4ODYNCj4+Pj4+IGFuZCBubyBvdGhlcnMgdXNlIHN5c19vbGRfc2VsZWN0Lg0KPj4+Pj4NCj4+
Pj4+IFNvIEkgdGhpbmsgd2UgaGF2ZSB0aGUgZm9sbG93aW5nIGJlaGF2aW91cnM6DQo+Pj4+Pg0K
Pj4+Pj4gKDEpIERlZmluZSBuZWl0aGVyIE5SX3NlbGVjdCBub3IgTlJfX25ld3NlbGVjdA0KPj4+
Pj4gIChhbmQgdXNlIHBzZWxlY3Q2IHN5c2NhbGwgZm9yIHNlbGVjdCk6DQo+Pj4+PiAgYWFyY2g2
NCwgb3BlbnJpc2MsIHRpbGVneCwgdW5pY29yZTMyLCBwcmVzdW1hYmx5IGFueSBmdXR1cmUgYXJj
aA0KPj4+Pj4NCj4+Pj4+ICgyKSBvbmx5IGRlZmluZSBOUl9fbmV3c2VsZWN0LCBpdCBpcyBuZXcg
c2VsZWN0Og0KPj4+Pj4gIG1pcHMsIG1pcHM2NCwgc2gsIHMzOTANCj4+Pj4+DQo+Pj4+PiAoMykg
T25seSBkZWZpbmUgTlJfc2VsZWN0LCB3YW50IHRoYXQgdG8gYmUgbmV3IHNlbGVjdDoNCj4+Pj4+
ICBhbHBoYSwgeDg2XzY0LCBzMzkweA0KPj4+Pj4NCj4+Pj4+ICg0KSBOUl9fbmV3c2VsZWN0IGlz
IG5ldyBzZWxlY3QsIE5SX3NlbGVjdCBpcyBvbGRfc2VsZWN0Og0KPj4+Pj4gIGkzODYsIG02OGss
IGFybSBpZiBrZXJuZWwgaXMgbm90IENPTkZJR19BRUFCSQ0KPj4+Pj4NCj4+Pj4+ICg1KSBOUl9f
bmV3c2VsZWN0IGlzIG5ldyBzZWxlY3QsIE5SX3NlbGVjdCBpcyBkZWZpbmVkIGJ1dA0KPj4+Pj4g
IGlmIGNhbGxlZCByZXR1cm5zIEVOT1NZUzoNCj4+Pj4+ICBtaWNyb2JsYXplLCBhcm0gaWYgQ09O
RklHX0FFQUJJLCBwcGM2NA0KPj4+Pj4NCj4+Pj4+ICg2KSBOUl9fbmV3c2VsZWN0IGlzIG5ldyBz
ZWxlY3QsIE5SX3NlbGVjdCBpcyBhIGJvbmtlcnMgY3VzdG9tDQo+Pj4+PiAgdGhpbmcgdGhhdCB0
cmllcyB0byBhdXRvZGV0ZWN0IHRoZSBjYWxsaW5nIGNvbnZlbnRpb246DQo+Pj4+PiBodHRwOi8v
bHhyLmZyZWUtZWxlY3Ryb25zLmNvbS9zb3VyY2UvYXJjaC9wb3dlcnBjL2tlcm5lbC9zeXNjYWxs
cy5jI0w4Ng0KPj4+Pj4gIHBwYzMyIChidXQgb25seSBuYXRpdmUgMzItYml0OyAzMi1iaXQgY29t
cGF0IHN1cHBvcnQNCj4+Pj4+ICBvbiBhIHBwYzY0IGtlcm5lbCBpcyBjYXRlZ29yeSA1LCBzbyBJ
IHZvdGUgZm9yIGlnbm9yaW5nDQo+Pj4+PiAgdGhpcyB3ZWlyZG5lc3MgYW5kIGNhbGxpbmcgcHBj
IGNhdGVnb3J5IDUpDQo+Pj4+Pg0KPj4+Pj4gKDcpIE5SX3NlbGVjdCBhbmQgTlJfX25ld3NlbGVj
dCBhcmUgZGlmZmVyZW50IG51bWJlcnMNCj4+Pj4+ICBidXQgYm90aCBhcmUgbmV3IHNlbGVjdDoN
Cj4+Pj4+ICBjcmlzLCBzcGFyYywgc3BhcmM2NA0KPj4+Pj4NCj4+Pj4+IHdoaWNoIGlzIGEgcHJl
dHR5IGNvbmZ1c2luZyBtZXNzLCBidXQgSSB0aGluayBpdCBlcXVhdGVzIHRvOg0KPj4+Pj4gKDAp
IGlmIGRlZmluZWQsIE5SX19uZXdzZWxlY3QgaXMgYWx3YXlzIG5ldyBzZWxlY3QNCj4+Pj4+ICgx
KSBpZiBOUl9zZWxlY3QgaXMgZGVmaW5lZCwgdGhlIGNob2ljZXMgYXJlOg0KPj4+Pj4gIChhKSBO
Ul9zZWxlY3QgaXMgb2xkX3NlbGVjdDoNCj4+Pj4+ICAgIGkzODYsIG02OGssIGFybQ0KPj4+Pj4g
IChiKSBOUl9zZWxlY3QgaXMgZGVmaW5lZCBidXQgc2hvdWxkIEVOT1NZUzoNCj4+Pj4+ICAgIG1p
Y3JvYmxhemUsIHBwYw0KPj4+Pj4gIChjKSBOUl9zZWxlY3QgZGVmaW5lZCBhbmQgaXMgbmV3IHNl
bGVjdDoNCj4+Pj4+ICAgIGV2ZXJ5dGhpbmcgZWxzZSAoYWxwaGEsIHg4Ni02NCwgczM5MHgsIGNy
aXMsIHNwYXJjLCBzcGFyYzY0KQ0KPj4+Pj4NCj4+Pj4+IGFuZCBJIHRoaW5rIHdlIHNob3VsZCBo
YW5kbGUgdGhhdCBieSBoYXZpbmcgdGhlIGNvZGUgaW4gc3lzY2FsbC5jDQo+Pj4+PiBiZSBzb21l
dGhpbmcgbGlrZToNCj4+Pj4+DQo+Pj4+PiAjaWZkZWYgVEFSR0VUX05SX3NlbGVjdA0KPj4+Pj4g
ICAgIGNhc2UgVEFSR0VUX05SX3NlbGVjdDoNCj4+Pj4+ICNpZiBkZWZpbmVkKFRBUkdFVF9XQU5U
X05JX09MRF9TRUxFQ1QpDQo+Pj4+PiAgICAgICAgIC8qIHNvbWUgYXJjaGl0ZWN0dXJlcyB1c2Vk
IHRvIGhhdmUgb2xkX3NlbGVjdCBoZXJlDQo+Pj4+PiAgICAgICAgICAqIGJ1dCBub3cgRU5PU1lT
IGl0Lg0KPj4+Pj4gICAgICAgICAgKi8NCj4+Pj4+ICAgICAgICAgcmV0ID0gLVRBUkdFVF9FTk9T
WVM7DQo+Pj4+PiAgICAgICAgIGJyZWFrOw0KPj4+Pj4gI2VsaWYgZGVmaW5lZChUQVJHRVRfV0FO
VF9PTERfU1lTX1NFTEVDVCkNCj4+Pj4+ICAgICAgICAgLyogY29kZSBmb3Igb2xkIHNlbGVjdCBo
ZXJlOyBtYXliZSBmYWN0b3JlZCBvdXQgdG8NCj4+Pj4+ICAgICAgICAgICogaXRzIG93biBmdW5j
dGlvbjogcmV0ID0gZG9fb2xkX3NlbGVjdCgpID8NCj4+Pj4+ICAgICAgICAgICovDQo+Pj4+PiAj
ZWxzZQ0KPj4+Pj4gICAgICAgICAvKiBzZWxlY3QgaXMgbmV3IHN0eWxlIHNlbGVjdCAqLw0KPj4+
Pj4gICAgICAgICByZXQgPSBkb19zZWxlY3QoLi4uKTsNCj4+Pj4+ICNlbmRpZg0KPj4+Pj4gI2Vu
ZGlmDQo+Pj4+DQo+Pj4+IEkgYWdyZWUsIHRoaXMgc2VlbXMgdG8gYmUgdGhlIGJlc3Qgd2F5IHRv
IGZpeCBzZWxlY3QgcHJvcGVybHkuDQo+Pj4NCj4+PiBPaywgaWYgbm8gb25lIGlzIGFscmVhZHkg
d29ya2luZyBvbiB0aGF0LCBJJ20gZ29pbmcgdG8gc2VuZCBhIHBhdGNoDQo+Pj4gYWNjb3JkaW5n
IHRvIFBldGVyJ3MgY29tbWVudHMuDQo+Pj4NCj4+PiBMYXVyZW50DQo+PiANCj4+IEkgd2FzIGhv
cGluZyB0bywgYnV0IEkgZG8gbm90IHRoaW5rIHRoYXQgSSB3aWxsIGdldCBhcm91bmQgdG8gaXQg
YW55dGltZSBzb29uLg0KPg0KPklmIEkgcHJvdmlkZSBhIHBhdGNoLCBjb3VsZCB5b3UgdGVzdCBp
dCBmb3IgeW91ciB0ZXN0IGNhc2U/DQo+DQo+VGhhbmtzLA0KPkxhdXJlbnQNCg0KRGVmaW5pdGVs
eSBJIHdvdWxkIGJlIGhhcHB5IHRvLiBJIHdvdWxkIGJlIHZlcnkgZ3JhdGVmdWwgaWYgeW91IGRp
ZC4NCg0KVGhhbmtzLA0KQWxsYW4NCg0K


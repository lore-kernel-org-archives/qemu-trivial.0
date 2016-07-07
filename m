Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bLEb0-0004xT-95
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jul 2016 15:04:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <awirth@akamai.com>) id 1bLEav-0004uV-Sz
	for qemu-trivial@nongnu.org; Thu, 07 Jul 2016 15:04:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <awirth@akamai.com>) id 1bLEau-0008K8-9b
	for qemu-trivial@nongnu.org; Thu, 07 Jul 2016 15:04:17 -0400
Received: from prod-mail-xrelay07.akamai.com ([23.79.238.175]:14574)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <awirth@akamai.com>)
	id 1bLEan-0008H6-LE; Thu, 07 Jul 2016 15:04:09 -0400
Received: from prod-mail-xrelay07.akamai.com (localhost.localdomain
	[127.0.0.1]) by postfix.imss70 (Postfix) with ESMTP id 9E5D6433499;
	Thu,  7 Jul 2016 19:04:05 +0000 (GMT)
Received: from prod-mail-relay10.akamai.com (prod-mail-relay10.akamai.com
	[172.27.118.251])
	by prod-mail-xrelay07.akamai.com (Postfix) with ESMTP id 862C8433439;
	Thu,  7 Jul 2016 19:04:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; s=a1;
	t=1467918245; bh=W3Lq5YHfNtiBfLB2n4wJ+oDsQOgOMDS9RYPOuYpFIVU=;
	l=7300; h=From:To:CC:Date:References:In-Reply-To:From;
	b=ygLceRv3N+tl3AMgJOuF71nC9XUIkpCuuyJf1tM7WdFrE8LWxcLwt9tg6AgNe0ZT8
	1zIrK4hnS8BoWyAW1valkx1nyj0SU8ZGuZnhZmQYTyuaemjgBWcYdLoI5g/JhWy13z
	eSm0DIg5ngn7UZsljjxX9vgVGr44F5IbtZayyfDo=
Received: from email.msg.corp.akamai.com (ustx2ex-cas4.msg.corp.akamai.com
	[172.27.25.33])
	by prod-mail-relay10.akamai.com (Postfix) with ESMTP id 61ED41FC8C;
	Thu,  7 Jul 2016 19:04:05 +0000 (GMT)
Received: from USTX2EX-DAG1MB3.msg.corp.akamai.com (172.27.27.103) by
	ustx2ex-dag1mb6.msg.corp.akamai.com (172.27.27.107) with Microsoft SMTP
	Server (TLS) id 15.0.1130.7; Thu, 7 Jul 2016 12:04:04 -0700
Received: from USTX2EX-DAG1MB3.msg.corp.akamai.com ([172.27.27.103]) by
	ustx2ex-dag1mb3.msg.corp.akamai.com ([172.27.27.103]) with mapi id
	15.00.1130.005; Thu, 7 Jul 2016 14:04:04 -0500
From: "Wirth, Allan" <awirth@akamai.com>
To: Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
	Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Timothy Pearson
	<tpearson@raptorengineering.com>
Thread-Topic: [Qemu-devel] [PATCH] linux-user: fix signal() syscall on x86_64
Thread-Index: AQHR05ALwApKz4zPX0yzVa9Bvxt/LaAD56uAgAE6SgCAABqkgIAAcV0AgAA6wYCAB8ShAIAAA6qA//+9SQA=
Date: Thu, 7 Jul 2016 19:04:04 +0000
Message-ID: <9DF3E0FA-AEF0-479C-891A-B1280DF2808F@akamai.com>
References: <92770843-66C8-471B-BA9C-DA46E92817B9@akamai.com>
	<CAFEAcA9VxFBB7BYBWY1gtHeScPkPehoh6SMVY-68UGz6RSFS=g@mail.gmail.com>
	<164e58f5-7dcc-bc9f-286f-98b5de56c1cb@vivier.eu>
	<CAFEAcA9mk9Z=M+tahGE7JBiQ_zidqF1pj=13eLr0GcxHcSis3Q@mail.gmail.com>
	<cc5798cf-4e88-f1e7-f3ca-45482e0822bb@vivier.eu>
	<CAFEAcA976boeHjzyHMr_83cq+uezzBq=SCWePW-9780UAp=kHA@mail.gmail.com>
	<20160707184944.GA30964@beaming.home>
	<a5c0b701-1e1a-198e-359e-f78cf2d97065@vivier.eu>
In-Reply-To: <a5c0b701-1e1a-198e-359e-f78cf2d97065@vivier.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.19.37.68]
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C3474BDD927344097BF616B91737839@akamai.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 23.79.238.175
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
X-List-Received-Date: Thu, 07 Jul 2016 19:04:19 -0000

DQoNCk9uIDcvNy8xNiwgMzowMiBQTSwgIkxhdXJlbnQgVml2aWVyIiA8bGF1cmVudEB2aXZpZXIu
ZXU+IHdyb3RlOg0KDQo+DQo+DQo+TGUgMDcvMDcvMjAxNiDDoCAyMDo0OSwgUmlrdSBWb2lwaW8g
YSDDqWNyaXQgOg0KPj4gT24gU2F0LCBKdWwgMDIsIDIwMTYgYXQgMDk6MTI6MDlQTSArMDEwMCwg
UGV0ZXIgTWF5ZGVsbCB3cm90ZToNCj4+PiBPbiAyIEp1bHkgMjAxNiBhdCAxNzo0MSwgTGF1cmVu
dCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1PiB3cm90ZToNCj4+Pj4gU2FkbHksIHRoaXMgY2Fu
J3Qgd29yazoNCj4+Pj4NCj4+Pj4gc3BhcmMvc3BhcmM2NC9jcmlzIHVzZSBzeXNfc2VsZWN0IGZv
ciBOUl9zZWxlY3QgQU5EIE5SX25ld3NlbGVjdC4NCj4+Pg0KPj4+PiBOb3Qgc3VyZSBhbGwgaXMg
Y29ycmVjdCwgYnV0IGl0J3Mgd2hhdCBJJ3ZlIGZvdW5kOg0KPj4+Pg0KPj4+PiAgICAgICAgICAg
ICB8IF9fTlJfc2VsZWN0ICAgIHwgX19OUl9fbmV3c2VsZWN0DQo+Pj4+IC0tLS0tLS0tLS0tLSst
LS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tKw0KPj4+PiBhcm0gICAgICAgICB8IHN5
c19vbGRfc2VsZWN0IHwgc3lzX3NlbGVjdCAgICAgIHwNCj4+Pj4gLS0tLS0tLS0tLS0tKy0tLS0t
LS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0rDQo+Pj4+IGFhcmNoNjQgICAgIHwgc3lzX3Nl
bGVjdCAgICAgfCAgICAgICAgLSAgICAgICAgfA0KPj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0tLS0t
LS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4gYWxwaGEgICAgICAgfCBzeXNfc2VsZWN0
ICAgICB8ICAgICAgICAtICAgICAgICB8DQo+Pj4+IC0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0t
LS0tKy0tLS0tLS0tLS0tLS0tLS0tKw0KPj4+PiBjcmlzICAgICAgICB8IHN5c19zZWxlY3QgICAg
IHwgc3lzX3NlbGVjdCAgICAgIHwNCj4+Pj4gLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0r
LS0tLS0tLS0tLS0tLS0tLS0rDQo+Pj4+IG02OGsgICAgICAgIHwgc3lzX29sZF9zZWxlY3QgfCBz
eXNfc2VsZWN0ICAgICAgfA0KPj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLSstLS0t
LS0tLS0tLS0tLS0tLSsNCj4+Pj4gbWljcm9ibGF6ZSAgfCBzeXNfb2xkX3NlbGVjdCB8IHN5c19z
ZWxlY3QgICAgICB8DQo+Pj4+IC0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0t
LS0tLS0tLS0tKw0KPj4+PiBtaXBzICAgICAgICB8IHN5c19vbGRfc2VsZWN0IHwgc3lzX3NlbGVj
dCAgICAgIHwNCj4+Pj4gLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0t
LS0tLS0rDQo+Pj4+IG1pcHM2NCAgICAgIHwgc3lzX3NlbGVjdCAgICAgfCAgICAgICAgLSAgICAg
ICAgfA0KPj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0t
LSsNCj4+Pj4gb3BlbnJpc2MgICAgfCBzeXNfc2VsZWN0ICAgICB8ICAgICAgICAtICAgICAgICB8
DQo+Pj4+IC0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tKw0K
Pj4+PiBwcGMgICAgICAgICB8IHN5c19vbGRfc2VsZWN0IHwgc3lzX3NlbGVjdCAgICAgIHwNCj4+
Pj4gLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0rDQo+Pj4+
IHMzOTB4ICAgICAgIHwgc3lzX3NlbGVjdCAgICAgfCAgICAgICAgLSAgICAgICAgfA0KPj4+PiAt
LS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4gc2g0
ICAgICAgICAgfCBzeXNfb2xkX3NlbGVjdCB8IHN5c19zZWxlY3QgICAgICB8DQo+Pj4+IC0tLS0t
LS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tKw0KPj4+PiBzcGFyYyAg
ICAgICB8IHN5c19zZWxlY3QgICAgIHwgc3lzX3NlbGVjdCAgICAgIHwNCj4+Pj4gLS0tLS0tLS0t
LS0tKy0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0rDQo+Pj4+IHNwYXJjNjQgICAg
IHwgc3lzX3NlbGVjdCAgICAgfCBzeXNfc2VsZWN0ICAgICAgfA0KPj4+PiAtLS0tLS0tLS0tLS0r
LS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4gdGlsZWd4ICAgICAgfCBz
eXNfc2VsZWN0ICAgICB8ICAgICAgICAtICAgICAgICB8DQo+Pj4+IC0tLS0tLS0tLS0tLSstLS0t
LS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tKw0KPj4+PiB1bmljb3JlMzIgICB8IHN5c19z
ZWxlY3QgICAgIHwgICAgICAgIC0gICAgICAgIHwNCj4+Pj4gLS0tLS0tLS0tLS0tKy0tLS0tLS0t
LS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0rDQo+Pj4+IHg4Nl82NCAgICAgIHwgc3lzX3NlbGVj
dCAgICAgfCAgICAgICAgLSAgICAgICAgfA0KPj4+PiAtLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0t
LS0tLSstLS0tLS0tLS0tLS0tLS0tLSsNCj4+Pj4gaTM4NiAgICAgICAgfCBzeXNfb2xkX3NlbGVj
dCB8IHN5c19zZWxlY3QgICAgICB8DQo+Pj4+IC0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0t
Ky0tLS0tLS0tLS0tLS0tLS0tKw0KPj4+DQo+Pj4gSG1tLiBMb29raW5nIGF0IGN1cnJlbnQgTGlu
dXggZ2l0IG1hc3RlciwgSSBnZXQNCj4+PiBzbGlnaHRseSBkaWZmZXJlbnQgcmVzdWx0cy4gVGhl
IG9ubHkgYXJjaGl0ZWN0dXJlcyB3aGljaA0KPj4+IGRlZmluZSBfX0FSQ0hfV0FOVF9TWVNfT0xE
X1NFTEVDVCBhcmU6DQo+Pj4gIGFybSwgbTY4aywgbW4xMDMwMCwgeDg2DQo+Pj4gYW5kIG5vIG90
aGVycyB1c2Ugc3lzX29sZF9zZWxlY3QuDQo+Pj4NCj4+PiBTbyBJIHRoaW5rIHdlIGhhdmUgdGhl
IGZvbGxvd2luZyBiZWhhdmlvdXJzOg0KPj4+DQo+Pj4gKDEpIERlZmluZSBuZWl0aGVyIE5SX3Nl
bGVjdCBub3IgTlJfX25ld3NlbGVjdA0KPj4+ICAoYW5kIHVzZSBwc2VsZWN0NiBzeXNjYWxsIGZv
ciBzZWxlY3QpOg0KPj4+ICBhYXJjaDY0LCBvcGVucmlzYywgdGlsZWd4LCB1bmljb3JlMzIsIHBy
ZXN1bWFibHkgYW55IGZ1dHVyZSBhcmNoDQo+Pj4NCj4+PiAoMikgb25seSBkZWZpbmUgTlJfX25l
d3NlbGVjdCwgaXQgaXMgbmV3IHNlbGVjdDoNCj4+PiAgbWlwcywgbWlwczY0LCBzaCwgczM5MA0K
Pj4+DQo+Pj4gKDMpIE9ubHkgZGVmaW5lIE5SX3NlbGVjdCwgd2FudCB0aGF0IHRvIGJlIG5ldyBz
ZWxlY3Q6DQo+Pj4gIGFscGhhLCB4ODZfNjQsIHMzOTB4DQo+Pj4NCj4+PiAoNCkgTlJfX25ld3Nl
bGVjdCBpcyBuZXcgc2VsZWN0LCBOUl9zZWxlY3QgaXMgb2xkX3NlbGVjdDoNCj4+PiAgaTM4Niwg
bTY4aywgYXJtIGlmIGtlcm5lbCBpcyBub3QgQ09ORklHX0FFQUJJDQo+Pj4NCj4+PiAoNSkgTlJf
X25ld3NlbGVjdCBpcyBuZXcgc2VsZWN0LCBOUl9zZWxlY3QgaXMgZGVmaW5lZCBidXQNCj4+PiAg
aWYgY2FsbGVkIHJldHVybnMgRU5PU1lTOg0KPj4+ICBtaWNyb2JsYXplLCBhcm0gaWYgQ09ORklH
X0FFQUJJLCBwcGM2NA0KPj4+DQo+Pj4gKDYpIE5SX19uZXdzZWxlY3QgaXMgbmV3IHNlbGVjdCwg
TlJfc2VsZWN0IGlzIGEgYm9ua2VycyBjdXN0b20NCj4+PiAgdGhpbmcgdGhhdCB0cmllcyB0byBh
dXRvZGV0ZWN0IHRoZSBjYWxsaW5nIGNvbnZlbnRpb246DQo+Pj4gaHR0cDovL2x4ci5mcmVlLWVs
ZWN0cm9ucy5jb20vc291cmNlL2FyY2gvcG93ZXJwYy9rZXJuZWwvc3lzY2FsbHMuYyNMODYNCj4+
PiAgcHBjMzIgKGJ1dCBvbmx5IG5hdGl2ZSAzMi1iaXQ7IDMyLWJpdCBjb21wYXQgc3VwcG9ydA0K
Pj4+ICBvbiBhIHBwYzY0IGtlcm5lbCBpcyBjYXRlZ29yeSA1LCBzbyBJIHZvdGUgZm9yIGlnbm9y
aW5nDQo+Pj4gIHRoaXMgd2VpcmRuZXNzIGFuZCBjYWxsaW5nIHBwYyBjYXRlZ29yeSA1KQ0KPj4+
DQo+Pj4gKDcpIE5SX3NlbGVjdCBhbmQgTlJfX25ld3NlbGVjdCBhcmUgZGlmZmVyZW50IG51bWJl
cnMNCj4+PiAgYnV0IGJvdGggYXJlIG5ldyBzZWxlY3Q6DQo+Pj4gIGNyaXMsIHNwYXJjLCBzcGFy
YzY0DQo+Pj4NCj4+PiB3aGljaCBpcyBhIHByZXR0eSBjb25mdXNpbmcgbWVzcywgYnV0IEkgdGhp
bmsgaXQgZXF1YXRlcyB0bzoNCj4+PiAoMCkgaWYgZGVmaW5lZCwgTlJfX25ld3NlbGVjdCBpcyBh
bHdheXMgbmV3IHNlbGVjdA0KPj4+ICgxKSBpZiBOUl9zZWxlY3QgaXMgZGVmaW5lZCwgdGhlIGNo
b2ljZXMgYXJlOg0KPj4+ICAoYSkgTlJfc2VsZWN0IGlzIG9sZF9zZWxlY3Q6DQo+Pj4gICAgaTM4
NiwgbTY4aywgYXJtDQo+Pj4gIChiKSBOUl9zZWxlY3QgaXMgZGVmaW5lZCBidXQgc2hvdWxkIEVO
T1NZUzoNCj4+PiAgICBtaWNyb2JsYXplLCBwcGMNCj4+PiAgKGMpIE5SX3NlbGVjdCBkZWZpbmVk
IGFuZCBpcyBuZXcgc2VsZWN0Og0KPj4+ICAgIGV2ZXJ5dGhpbmcgZWxzZSAoYWxwaGEsIHg4Ni02
NCwgczM5MHgsIGNyaXMsIHNwYXJjLCBzcGFyYzY0KQ0KPj4+DQo+Pj4gYW5kIEkgdGhpbmsgd2Ug
c2hvdWxkIGhhbmRsZSB0aGF0IGJ5IGhhdmluZyB0aGUgY29kZSBpbiBzeXNjYWxsLmMNCj4+PiBi
ZSBzb21ldGhpbmcgbGlrZToNCj4+Pg0KPj4+ICNpZmRlZiBUQVJHRVRfTlJfc2VsZWN0DQo+Pj4g
ICAgIGNhc2UgVEFSR0VUX05SX3NlbGVjdDoNCj4+PiAjaWYgZGVmaW5lZChUQVJHRVRfV0FOVF9O
SV9PTERfU0VMRUNUKQ0KPj4+ICAgICAgICAgLyogc29tZSBhcmNoaXRlY3R1cmVzIHVzZWQgdG8g
aGF2ZSBvbGRfc2VsZWN0IGhlcmUNCj4+PiAgICAgICAgICAqIGJ1dCBub3cgRU5PU1lTIGl0Lg0K
Pj4+ICAgICAgICAgICovDQo+Pj4gICAgICAgICByZXQgPSAtVEFSR0VUX0VOT1NZUzsNCj4+PiAg
ICAgICAgIGJyZWFrOw0KPj4+ICNlbGlmIGRlZmluZWQoVEFSR0VUX1dBTlRfT0xEX1NZU19TRUxF
Q1QpDQo+Pj4gICAgICAgICAvKiBjb2RlIGZvciBvbGQgc2VsZWN0IGhlcmU7IG1heWJlIGZhY3Rv
cmVkIG91dCB0bw0KPj4+ICAgICAgICAgICogaXRzIG93biBmdW5jdGlvbjogcmV0ID0gZG9fb2xk
X3NlbGVjdCgpID8NCj4+PiAgICAgICAgICAqLw0KPj4+ICNlbHNlDQo+Pj4gICAgICAgICAvKiBz
ZWxlY3QgaXMgbmV3IHN0eWxlIHNlbGVjdCAqLw0KPj4+ICAgICAgICAgcmV0ID0gZG9fc2VsZWN0
KC4uLik7DQo+Pj4gI2VuZGlmDQo+Pj4gI2VuZGlmDQo+PiANCj4+IEkgYWdyZWUsIHRoaXMgc2Vl
bXMgdG8gYmUgdGhlIGJlc3Qgd2F5IHRvIGZpeCBzZWxlY3QgcHJvcGVybHkuDQo+DQo+T2ssIGlm
IG5vIG9uZSBpcyBhbHJlYWR5IHdvcmtpbmcgb24gdGhhdCwgSSdtIGdvaW5nIHRvIHNlbmQgYSBw
YXRjaA0KPmFjY29yZGluZyB0byBQZXRlcidzIGNvbW1lbnRzLg0KPg0KPkxhdXJlbnQNCg0KSSB3
YXMgaG9waW5nIHRvLCBidXQgSSBkbyBub3QgdGhpbmsgdGhhdCBJIHdpbGwgZ2V0IGFyb3VuZCB0
byBpdCBhbnl0aW1lIHNvb24uDQoNCi1BbGxhbg0KDQo=


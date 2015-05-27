Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxQ8Q-0003b7-Vw
	for mharc-qemu-trivial@gnu.org; Tue, 26 May 2015 21:27:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenhanxiao@cn.fujitsu.com>) id 1YxQ8O-0003aA-EN
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 21:27:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenhanxiao@cn.fujitsu.com>) id 1YxQ8L-00078v-9R
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 21:27:52 -0400
Received: from [59.151.112.132] (port=2857 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenhanxiao@cn.fujitsu.com>) id 1YxQ8K-00077P-TV
	for qemu-trivial@nongnu.org; Tue, 26 May 2015 21:27:49 -0400
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="95898814"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 May 2015 09:32:12 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t4R1QHHa003135;
	Wed, 27 May 2015 09:26:17 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Wed, 27 May 2015 09:27:46 +0800
From: "Chen, Hanxiao" <chenhanxiao@cn.fujitsu.com>
To: Markus Armbruster <armbru@redhat.com>
Thread-Topic: [Qemu-devel][PATCH] docs/writing-qmp-commands: fix a typo
Thread-Index: AQHQl6OrRyuvO+6guUaxUMD4OhJfK52PCTNg
Date: Wed, 27 May 2015 01:27:47 +0000
Message-ID: <5871495633F38949900D2BF2DC04883E73900C0F@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1432632341-5201-1-git-send-email-chenhanxiao@cn.fujitsu.com>
	<87lhgb8utk.fsf@blackfin.pond.sub.org>
In-Reply-To: <87lhgb8utk.fsf@blackfin.pond.sub.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.34]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel][PATCH] docs/writing-qmp-commands:
	fix a typo
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
X-List-Received-Date: Wed, 27 May 2015 01:27:53 -0000

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFya3VzIEFybWJydXN0
ZXIgW21haWx0bzphcm1icnVAcmVkaGF0LmNvbV0NCj4gU2VudDogVHVlc2RheSwgTWF5IDI2LCAy
MDE1IDc6MDMgUE0NCj4gVG86IENoZW4sIEhhbnhpYW8vs8Ig6s/P9g0KPiBDYzogcWVtdS10cml2
aWFsQG5vbmdudS5vcmcNCj4gU3ViamVjdDogUmU6IFtRZW11LWRldmVsXVtQQVRDSF0gZG9jcy93
cml0aW5nLXFtcC1jb21tYW5kczogZml4IGEgdHlwbw0KPiANCj4gQ2hlbiBIYW54aWFvIDxjaGVu
aGFueGlhb0Bjbi5mdWppdHN1LmNvbT4gd3JpdGVzOg0KPiANCj4gPiBzL2ludGVyYXRpb24vaXRl
cmF0aW9uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIEhhbnhpYW8gPGNoZW5oYW54aWFv
QGNuLmZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiA+ICBkb2NzL3dyaXRpbmctcW1wLWNvbW1hbmRz
LnR4dCB8IDIgKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZG9jcy93cml0aW5nLXFtcC1jb21tYW5kcy50
eHQgYi9kb2NzL3dyaXRpbmctcW1wLWNvbW1hbmRzLnR4dA0KPiA+IGluZGV4IGYzZGYyMDYuLmFi
MWZkZDMgMTAwNjQ0DQo+ID4gLS0tIGEvZG9jcy93cml0aW5nLXFtcC1jb21tYW5kcy50eHQNCj4g
PiArKysgYi9kb2NzL3dyaXRpbmctcW1wLWNvbW1hbmRzLnR4dA0KPiA+IEBAIC01OTgsNyArNTk4
LDcgQEAgc3RvcmVkIGluIGl0cyAidmFsdWUiIG1lbWJlci4gSW4gb3VyIGV4YW1wbGUsIHRoZQ0K
PiA+ICJ2YWx1ZSIgbWVtYmVyIGlzIGEgcG9pbnRlcg0KPiA+ICB0byBhbiBUaW1lckFsYXJtTWV0
aG9kIGluc3RhbmNlLg0KPiA+DQo+ID4gIE5vdGljZSB0aGF0IHRoZSAiY3VycmVudCIgdmFyaWFi
bGUgaXMgdXNlZCBhcyAidHJ1ZSIgb25seSBpbiB0aGUgZmlyc3QNCj4gPiAtaW50ZXJhdGlvbiBv
ZiB0aGUgbG9vcC4gVGhhdCdzIGJlY2F1c2UgdGhlIGFsYXJtIHRpbWVyIG1ldGhvZCBpbiB1c2Ug
aXMgdGhlDQo+ID4gK2l0ZXJhdGlvbiBvZiB0aGUgbG9vcC4gVGhhdCdzIGJlY2F1c2UgdGhlIGFs
YXJtIHRpbWVyIG1ldGhvZCBpbiB1c2UgaXMgdGhlDQo+ID4gIGZpcnN0IGVsZW1lbnQgb2YgdGhl
IGFsYXJtX3RpbWVycyBhcnJheS4gQWxzbyBub3RpY2UgdGhhdCBRQVBJIGxpc3RzDQo+ID4gYXJl
IGhhbmRsZWQNCj4gPiAgYnkgaGFuZCBhbmQgd2UgcmV0dXJuIHRoZSBoZWFkIG9mIHRoZSBsaXN0
Lg0KPiANCj4gSSdtIGFmcmFpZCB5b3UgbmVlZCB0byByZXNlbmQNCj4gDQo+ICAgICBUbzogcWVt
dS1kZXZlbEBub25nbnUub3JnDQo+ICAgICBDYzogcWVtdS10cml2aWFsQG5vbmdudS5vcmcsIC4u
Lg0KDQoNClRoYW5rcywgSSdsbCByZXNlbmQgaXQgbGF0ZXIuDQoNClJlZ2FyZHMsDQotIENoZW4N
Cg==


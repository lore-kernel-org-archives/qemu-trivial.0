Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bNENu-0000Bv-Kv
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jul 2016 03:15:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1bNENs-0000A7-JA
	for qemu-trivial@nongnu.org; Wed, 13 Jul 2016 03:15:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1bNENr-0007vU-9M
	for qemu-trivial@nongnu.org; Wed, 13 Jul 2016 03:15:04 -0400
Received: from [59.151.112.132] (port=33557 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>)
	id 1bNENk-0007jI-9L; Wed, 13 Jul 2016 03:14:58 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="8658276"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jul 2016 15:14:05 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 5567241C0BB6;
	Wed, 13 Jul 2016 15:14:05 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0279.002; Wed, 13 Jul 2016 15:14:03 +0800
From: "Wei, Jiangang" <weijg.fnst@cn.fujitsu.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "marcel@redhat.com" <marcel@redhat.com>, "armbru@redhat.com"
	<armbru@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH 0/2] convert device initialization functions
Thread-Index: AQHR1/Bj5Rma1wSnYky8UpxAzfL8JaAVdZmA
Date: Wed, 13 Jul 2016 07:14:01 +0000
Message-ID: <1468393897.2020.7.camel@localhost>
References: <1463480327-3198-1-git-send-email-weijg.fnst@cn.fujitsu.com>
	<1467257658.2514.14.camel@localhost>
	<1467855432.2119.58.camel@localhost>
In-Reply-To: <1467855432.2119.58.camel@localhost>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.50]
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C85F0D5C3946C42A011C72BA05AC1B0@fujitsu.local>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 5567241C0BB6.A661B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: weijg.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2] convert device
 initialization functions
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
X-List-Received-Date: Wed, 13 Jul 2016 07:15:05 -0000

Y2MgcWVtdS10cml2aWFsDQoNClRoZSBmb2xsb3dpbmcgcGF0Y2hlcyBoYWQg
YmVlbiByZXZpZXdlZCBvbmUgbW9udGggYWdvLCANCkJ1dCBzbyBmYXIsIEl0
IGhhdmVuJ3QgYmVlbiBtZXJnZWQuDQpNYXkgSSB0cm91YmxlIGFueSBtYWlu
dGFpbmVyIGdpdmUgbWUgc29tZSBmZWVkYmFjaz8NCg0KaHcvcGNpLWJyaWRn
ZTogQ29udmVydCBweGIgaW5pdGlhbGl6YXRpb24gZnVuY3Rpb25zIHRvIEVy
cm9yDQphcGI6IGNvbnZlcnQgaW5pdCB0byByZWFsaXplDQoNClRoYW5rcywN
CndlaQ0KT24gVGh1LCAyMDE2LTA3LTA3IGF0IDAxOjM5ICswMDAwLCBXZWks
IEppYW5nYW5nIHdyb3RlOg0KPiBQaW5nIGFnYWluIC4uLg0KPiBNYXkgSSBh
c2sgZm9yIHNvbWUgYXR0ZW50aW9uIGZvciB0aGVzZSB0d28gcGF0Y2hlc++8
nw0KPiANCj4gVGhhbmtzDQo+IHdlaQ0KPiBPbiBUaHUsIDIwMTYtMDYtMzAg
YXQgMDM6MzYgKzAwMDAsIFdlaSwgSmlhbmdhbmcgd3JvdGU6DQo+ID4gUGlu
Zw0KPiA+IFRoZXNlIHR3byBwYXRjaGVzIHNlZW0gdG8gYmUgZm9yZ290dGVu
IC4uLg0KPiA+IA0KPiA+IE9uIFR1ZSwgMjAxNi0wNS0xNyBhdCAxODoxOCAr
MDgwMCwgV2VpIEppYW5nYW5nIHdyb3RlOg0KPiA+ID4gVGhlIGZpcnN0IGhh
ZCBiZWVuIHJldmlld2VkLg0KPiA+ID4gVGhlIHNlY29uZCBoYWQgYmVlbiBw
b3N0ZWQgbGFzdCBtb250aCwgYnV0IG5vIGZlZWRiYWNrLg0KPiA+ID4gVGhl
eSdyZSBzaW1pbGFyLCBzbyByZXNlbmQgdGhlbSB0b2dldGhlci4NCj4gPiA+
IA0KPiA+ID4gV2VpIEppYW5nYW5nICgyKToNCj4gPiA+ICAgaHcvcGNpLWJy
aWRnZTogQ29udmVydCBweGIgaW5pdGlhbGl6YXRpb24gZnVuY3Rpb25zIHRv
IEVycm9yDQo+ID4gPiAgIGFwYjogY29udmVydCBpbml0IHRvIHJlYWxpemUN
Cj4gPiA+IA0KPiA+ID4gIGh3L3BjaS1icmlkZ2UvcGNpX2V4cGFuZGVyX2Jy
aWRnZS5jIHwgNTIgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KPiA+ID4gIGh3L3BjaS1ob3N0L2FwYi5jICAgICAgICAgICAgICAg
ICAgIHwgIDUgKystLQ0KPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjcgaW5z
ZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiANCj4g
PiANCj4gPiANCj4gDQo+IA0KPiANCg0KCgo=


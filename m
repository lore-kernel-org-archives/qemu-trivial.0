Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aqXom-0007WB-31
	for mharc-qemu-trivial@gnu.org; Wed, 13 Apr 2016 23:19:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1aqXok-0007TU-Ef
	for qemu-trivial@nongnu.org; Wed, 13 Apr 2016 23:19:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1aqXoj-0000WO-Nj
	for qemu-trivial@nongnu.org; Wed, 13 Apr 2016 23:19:42 -0400
Received: from [59.151.112.132] (port=6738 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>)
	id 1aqXod-0000Uu-Ql; Wed, 13 Apr 2016 23:19:36 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5582984"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Apr 2016 11:19:22 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 2C83A42B55E4;
	Thu, 14 Apr 2016 11:19:17 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0279.002; Thu, 14 Apr 2016 11:19:16 +0800
From: "Wei, Jiangang" <weijg.fnst@cn.fujitsu.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>
Thread-Topic: [Qemu-devel][PATCH] accel: make configure_accelerator return void
Thread-Index: AQHRfqNEi9ETMX9rv0KNK5ZxmL9M2p+IdXWA
Date: Thu, 14 Apr 2016 03:19:16 +0000
Message-ID: <1460603955.2269.29.camel@localhost>
References: <1458036463-20180-1-git-send-email-weijg.fnst@cn.fujitsu.com>
In-Reply-To: <1458036463-20180-1-git-send-email-weijg.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.50]
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF8EBE9F2229BA49AC4F59EB59BA69CC@fujitsu.local>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 2C83A42B55E4.A94F5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: weijg.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel][PATCH] accel: make
 configure_accelerator return void
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
X-List-Received-Date: Thu, 14 Apr 2016 03:19:43 -0000

cGluZy4uLg0KQW55IGNvbW1lbnRzPw0KT24gVHVlLCAyMDE2LTAzLTE1IGF0
IDE4OjA3ICswODAwLCBXZWkgSmlhbmdhbmcgd3JvdGU6DQo+IFJldHVybiB0
aGUgbmVnYXRlZCB2YWx1ZSBvZiBhY2NlbF9pbml0aWFsaXNlZCBpcyBtZWFu
aW5nbGVzcywNCj4gYW5kIHRoZSBjYWxsZXIgdmwgZG9lc24ndCBjaGVjayBp
dC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFdlaSBKaWFuZ2FuZyA8d2Vpamcu
Zm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gLS0tDQo+ICBhY2NlbC5jIHwgNCAr
LS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYWNjZWwuYyBiL2FjY2Vs
LmMNCj4gaW5kZXggMDUxMGI5MC4uNDAzZWI1ZSAxMDA2NDQNCj4gLS0tIGEv
YWNjZWwuYw0KPiArKysgYi9hY2NlbC5jDQo+IEBAIC03Nyw3ICs3Nyw3IEBA
IHN0YXRpYyBpbnQgYWNjZWxfaW5pdF9tYWNoaW5lKEFjY2VsQ2xhc3MgKmFj
YywgTWFjaGluZVN0YXRlICptcykNCj4gICAgICByZXR1cm4gcmV0Ow0KPiAg
fQ0KPiAgDQo+IC1pbnQgY29uZmlndXJlX2FjY2VsZXJhdG9yKE1hY2hpbmVT
dGF0ZSAqbXMpDQo+ICt2b2lkIGNvbmZpZ3VyZV9hY2NlbGVyYXRvcihNYWNo
aW5lU3RhdGUgKm1zKQ0KPiAgew0KPiAgICAgIGNvbnN0IGNoYXIgKnA7DQo+
ICAgICAgY2hhciBidWZbMTBdOw0KPiBAQCAtMTI4LDggKzEyOCw2IEBAIGlu
dCBjb25maWd1cmVfYWNjZWxlcmF0b3IoTWFjaGluZVN0YXRlICptcykNCj4g
ICAgICBpZiAoaW5pdF9mYWlsZWQpIHsNCj4gICAgICAgICAgZnByaW50Zihz
dGRlcnIsICJCYWNrIHRvICVzIGFjY2VsZXJhdG9yLlxuIiwgYWNjLT5uYW1l
KTsNCj4gICAgICB9DQo+IC0NCj4gLSAgICByZXR1cm4gIWFjY2VsX2luaXRp
YWxpc2VkOw0KPiAgfQ0KPiAgDQo+IA0KDQoKCg==


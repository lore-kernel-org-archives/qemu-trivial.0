Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XX8ai-0006LC-N2
	for mharc-qemu-trivial@gnu.org; Thu, 25 Sep 2014 08:56:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XX8ac-0006E0-8z
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 08:56:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XX8aX-0004Kp-R2
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 08:56:06 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:26650)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XX8aX-0004Iu-5j; Thu, 25 Sep 2014 08:56:01 -0400
Received: from 172.24.2.119 (EHLO SZXEMA407-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCD60266; Thu, 25 Sep 2014 20:55:48 +0800 (CST)
Received: from SZXEMA503-MBS.china.huawei.com ([169.254.6.188]) by
	SZXEMA407-HUB.china.huawei.com ([10.82.72.39]) with mapi id
	14.03.0158.001; Thu, 25 Sep 2014 20:55:39 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Eric Blake <eblake@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH 4/4] oslib-posix/win32: convert
	fprintf/perror to error_report
Thread-Index: AQHP2KWc2VLzmYR+gkGP+r9z4JsnG5wRQ0YAgACLLaA=
Date: Thu, 25 Sep 2014 12:55:38 +0000
Message-ID: <33183CC9F5247A488A2544077AF1902086DDB34C@SZXEMA503-MBS.china.huawei.com>
References: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>
	<1411638384-5844-5-git-send-email-arei.gonglei@huawei.com>
	<54240C52.3030709@redhat.com>
In-Reply-To: <54240C52.3030709@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.177.19.102]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"Huangweidong \(C\)" <weidong.huang@huawei.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Luonengjun <luonengjun@huawei.com>, "mjt@tls.msk.ru" <mjt@tls.msk.ru>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/4] oslib-posix/win32:
 convert fprintf/perror to error_report
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
X-List-Received-Date: Thu, 25 Sep 2014 12:56:11 -0000

PiBTdWJqZWN0OiBSZTogW1FlbXUtZGV2ZWxdIFtQQVRDSCA0LzRdIG9zbGliLXBvc2l4L3dpbjMy
OiBjb252ZXJ0IGZwcmludGYvcGVycm9yDQo+IHRvIGVycm9yX3JlcG9ydA0KPiANCj4gT24gMDkv
MjUvMjAxNCAwMzo0NiBBTSwgYXJlaS5nb25nbGVpQGh1YXdlaS5jb20gd3JvdGU6DQo+ID4gRnJv
bTogR29uZ2xlaSA8YXJlaS5nb25nbGVpQGh1YXdlaS5jb20+DQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBHb25nbGVpIDxhcmVpLmdvbmdsZWlAaHVhd2VpLmNvbT4NCj4gPiAtLS0NCj4gPiAgdXRp
bC9vc2xpYi1wb3NpeC5jIHwgOCArKysrLS0tLQ0KPiA+ICB1dGlsL29zbGliLXdpbjMyLmMgfCAy
ICstDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQ0KPiA+DQo+IA0KPiA+IEBAIC0zODAsNyArMzgwLDcgQEAgdm9pZCBvc19tZW1fcHJlYWxsb2Mo
aW50IGZkLCBjaGFyICphcmVhLCBzaXplX3QNCj4gbWVtb3J5KQ0KPiA+DQo+ID4gICAgICByZXQg
PSBzaWdhY3Rpb24oU0lHQlVTLCAmYWN0LCAmb2xkYWN0KTsNCj4gPiAgICAgIGlmIChyZXQpIHsN
Cj4gPiAtICAgICAgICBwZXJyb3IoIm9zX21lbV9wcmVhbGxvYzogZmFpbGVkIHRvIGluc3RhbGwg
c2lnbmFsIGhhbmRsZXIiKTsNCj4gPiArICAgICAgICBlcnJvcl9yZXBvcnQoIm9zX21lbV9wcmVh
bGxvYzogZmFpbGVkIHRvIGluc3RhbGwgc2lnbmFsIGhhbmRsZXIiKTsNCj4gPiAgICAgICAgICBl
eGl0KDEpOw0KPiA+ICAgICAgfQ0KPiA+DQo+ID4gQEAgLTM5MCw3ICszOTAsNyBAQCB2b2lkIG9z
X21lbV9wcmVhbGxvYyhpbnQgZmQsIGNoYXIgKmFyZWEsIHNpemVfdA0KPiBtZW1vcnkpDQo+ID4g
ICAgICBwdGhyZWFkX3NpZ21hc2soU0lHX1VOQkxPQ0ssICZzZXQsICZvbGRzZXQpOw0KPiA+DQo+
ID4gICAgICBpZiAoc2lnc2V0am1wKHNpZ2p1bXAsIDEpKSB7DQo+ID4gLSAgICAgICAgZnByaW50
ZihzdGRlcnIsICJvc19tZW1fcHJlYWxsb2M6IGZhaWxlZCB0byBwcmVhbGxvY2F0ZSBwYWdlc1xu
Iik7DQo+ID4gKyAgICAgICAgZXJyb3JfcmVwb3J0KCJvc19tZW1fcHJlYWxsb2M6IGZhaWxlZCB0
byBwcmVhbGxvY2F0ZSBwYWdlcyIpOw0KPiANCj4gQW5vdGhlciByZWR1Y3Rpb24gaW4gZXJyb3Ig
bWVzc2FnZSBxdWFsaXR5LiAgWW91J2xsIGRlZmluaXRlbHkgbmVlZCB0bw0KPiByZXNwaW4gdGhp
cyBzZXJpZXMsIGFuZCBhdCB0aGlzIHBvaW50LCBJIGRvbid0IGtub3cgaWYgeW91IGNhbiBjYWxs
IGl0DQo+IHRyaXZpYWwuDQo+IA0KT0suIA0KDQpCZXN0IHJlZ2FyZHMsDQotR29uZ2xlaQ0KDQo+
IC0tDQo+IEVyaWMgQmxha2UgICBlYmxha2UgcmVkaGF0IGNvbSAgICArMS05MTktMzAxLTMyNjYN
Cj4gTGlidmlydCB2aXJ0dWFsaXphdGlvbiBsaWJyYXJ5IGh0dHA6Ly9saWJ2aXJ0Lm9yZw0KDQo=


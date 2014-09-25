Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XX8ZP-0004aR-Sx
	for mharc-qemu-trivial@gnu.org; Thu, 25 Sep 2014 08:54:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XX8ZJ-0004Re-S3
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 08:54:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XX8ZF-0003yD-4L
	for qemu-trivial@nongnu.org; Thu, 25 Sep 2014 08:54:45 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:26136)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XX8ZE-0003xW-I9; Thu, 25 Sep 2014 08:54:41 -0400
Received: from 172.24.2.119 (EHLO SZXEMA405-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCD60090; Thu, 25 Sep 2014 20:54:18 +0800 (CST)
Received: from SZXEMA503-MBS.china.huawei.com ([169.254.6.188]) by
	SZXEMA405-HUB.china.huawei.com ([10.82.72.37]) with mapi id
	14.03.0158.001; Thu, 25 Sep 2014 20:54:11 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Eric Blake <eblake@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH 3/4] osdep: convert fprintf to error_report
Thread-Index: AQHP2KWdkNxYaBghF0WKARlfQ54LoJwRQv6AgACLDbA=
Date: Thu, 25 Sep 2014 12:54:10 +0000
Message-ID: <33183CC9F5247A488A2544077AF1902086DDB33B@SZXEMA503-MBS.china.huawei.com>
References: <1411638384-5844-1-git-send-email-arei.gonglei@huawei.com>
	<1411638384-5844-4-git-send-email-arei.gonglei@huawei.com>
	<54240C15.1010408@redhat.com>
In-Reply-To: <54240C15.1010408@redhat.com>
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
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/4] osdep: convert fprintf
	to error_report
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
X-List-Received-Date: Thu, 25 Sep 2014 12:54:50 -0000

PiBTdWJqZWN0OiBSZTogW1FlbXUtZGV2ZWxdIFtQQVRDSCAzLzRdIG9zZGVwOiBjb252ZXJ0IGZw
cmludGYgdG8gZXJyb3JfcmVwb3J0DQo+IA0KPiBPbiAwOS8yNS8yMDE0IDAzOjQ2IEFNLCBhcmVp
LmdvbmdsZWlAaHVhd2VpLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBHb25nbGVpIDxhcmVpLmdvbmds
ZWlAaHVhd2VpLmNvbT4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEdvbmdsZWkgPGFyZWkuZ29u
Z2xlaUBodWF3ZWkuY29tPg0KPiA+IC0tLQ0KPiA+ICB1dGlsL29zZGVwLmMgfCA4ICsrKystLS0t
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdXRpbC9vc2RlcC5jIGIvdXRpbC9vc2RlcC5jDQo+ID4gaW5k
ZXggYjJiZDE1NC4uN2Y2ZTQ4MyAxMDA2NDQNCj4gPiAtLS0gYS91dGlsL29zZGVwLmMNCj4gPiAr
KysgYi91dGlsL29zZGVwLmMNCj4gPiBAQCAtNDAxLDkgKzQwMSw5IEBAIHZvaWQgZmlwc19zZXRf
c3RhdGUoYm9vbCByZXF1ZXN0ZWQpDQo+ID4gICNlbmRpZiAvKiBfX2xpbnV4X18gKi8NCj4gPg0K
PiA+ICAjaWZkZWYgX0ZJUFNfREVCVUcNCj4gPiAtICAgIGZwcmludGYoc3RkZXJyLCAiRklQUyBt
b2RlICVzIChyZXF1ZXN0ZWQgJXMpXG4iLA0KPiA+IC0JICAgIChmaXBzX2VuYWJsZWQgPyAiZW5h
YmxlZCIgOiAiZGlzYWJsZWQiKSwNCj4gPiAtCSAgICAocmVxdWVzdGVkID8gImVuYWJsZWQiIDog
ImRpc2FibGVkIikpOw0KPiA+ICsgICAgZXJyb3JfcmVwb3J0KCJGSVBTIG1vZGUgJXMgKHJlcXVl
c3RlZCAlcykiLA0KPiA+ICsgICAgICAgICAgICAgICAgIChmaXBzX2VuYWJsZWQgPyAiZW5hYmxl
ZCIgOiAiZGlzYWJsZWQiKSwNCj4gPiArICAgICAgICAgICAgICAgICAocmVxdWVzdGVkID8gImVu
YWJsZWQiIDogImRpc2FibGVkIikpOw0KPiANCj4gRG8gd2UgcmVhbGx5IHdhbnQgZGVidWdnaW5n
IG1lc3NhZ2VzIGdvaW5nIHRocm91Z2ggZXJyb3JfcmVwb3J0KCk/ICBUaGlzDQo+IG1heSBiZSBv
bmUgaHVuayB3ZSBkb24ndCB3YW50Lg0KPiANClllcCwgYWdyZWUuDQoNCkJlc3QgcmVnYXJkcywN
Ci1Hb25nbGVpDQoNCj4gLS0NCj4gRXJpYyBCbGFrZSAgIGVibGFrZSByZWRoYXQgY29tICAgICsx
LTkxOS0zMDEtMzI2Ng0KPiBMaWJ2aXJ0IHZpcnR1YWxpemF0aW9uIGxpYnJhcnkgaHR0cDovL2xp
YnZpcnQub3JnDQoNCg==


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kYRZS-00056r-1H
	for mharc-qemu-trivial@gnu.org; Fri, 30 Oct 2020 06:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kYRZQ-00054o-9Z; Fri, 30 Oct 2020 06:23:44 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kYRZO-0008Pk-6J; Fri, 30 Oct 2020 06:23:44 -0400
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4CMz0z234cz50Vr;
 Fri, 30 Oct 2020 18:23:31 +0800 (CST)
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.225]) by
 DGGEMM401-HUB.china.huawei.com ([10.3.20.209]) with mapi id 14.03.0487.000;
 Fri, 30 Oct 2020 18:23:20 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>
CC: Pannengyuan <pannengyuan@huawei.com>, "lvivier@redhat.com"
 <lvivier@redhat.com>, Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 ganqixin <ganqixin@huawei.com>
Subject: RE: [PATCH RESEND v2 0/7] some memleak trivial patchs
Thread-Topic: [PATCH RESEND v2 0/7] some memleak trivial patchs
Thread-Index: AQHWqQOAYexAkoH4WUOcMVYmxKZpOamv9+yw
Date: Fri, 30 Oct 2020 10:23:19 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BA18CD8@dggemm531-mbx.china.huawei.com>
References: <20201023061218.2080844-1-kuhn.chenqun@huawei.com>
In-Reply-To: <20201023061218.2080844-1-kuhn.chenqun@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.149]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga02-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 06:23:31
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Oct 2020 10:23:44 -0000

UGluZyENCg0KSGkgYWxsLA0KICBUaGUgcGF0Y2hlMiB+NyBoYXZlIGJlZW4gcmV2aWV3ZWQgZm9y
IHNvbWUgdGltZS4gDQpDb3VsZCBzb21lb25lIHBsZWFzZSBwaWNrIGl0IHVwo78NCg0KVGhhbmtz
LA0KQ2hlbiBRdW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDaGVu
cXVuIChrdWhuKQ0KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIgMjMsIDIwMjAgMjoxMiBQTQ0KPiBU
bzogcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LXRyaXZpYWxAbm9uZ251Lm9yZw0KPiBDYzog
UGFubmVuZ3l1YW4gPHBhbm5lbmd5dWFuQGh1YXdlaS5jb20+OyBsdml2aWVyQHJlZGhhdC5jb207
DQo+IFpoYW5naGFpbGlhbmcgPHpoYW5nLnpoYW5naGFpbGlhbmdAaHVhd2VpLmNvbT47IGdhbnFp
eGluDQo+IDxnYW5xaXhpbkBodWF3ZWkuY29tPjsgQ2hlbnF1biAoa3VobikgPGt1aG4uY2hlbnF1
bkBodWF3ZWkuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggUkVTRU5EIHYyIDAvN10gc29tZSBtZW1s
ZWFrIHRyaXZpYWwgcGF0Y2hzDQo+IA0KPiBIaSBhbGwsDQo+IA0KPiAgIEhlcmUgYXJlIHNvbWUg
bWVtb3J5IGxlYWsgcGF0Y2hlcyByZXBvcnRlZCBieSBFdWxlclJvYm90Lg0KPiBTb21lIHBhdGNo
IHN1Ym1pc3Npb25zIGhhdmUgYmVlbiB1bmF0dGVuZGVkIGZvciBhIHdoaWxlIGFuZCBJIHJlc2Vu
ZCB0aGVtLg0KPiANCj4gVGhhbmtzLA0KPiBDaGVuIFF1bg0KPiANCj4gDQo+IENoZW4gUXVuICgx
KToNCj4gICB0ZXN0cy9taWdyYXRpb246IGZpeCBtZW1sZWFrIGluIHdhaXRfY29tbWFuZC93YWl0
X2NvbW1hbmRfZmQNCj4gDQo+IFBhbiBOZW5neXVhbiAoNik6DQo+ICAgcWdhL2NoYW5uZWwtcG9z
aXg6IFBsdWcgbWVtb3J5IGxlYWsgaW4gZ2FfY2hhbm5lbF93cml0ZV9hbGwoKQ0KPiAgIGVsZjJk
bXAvcWVtdV9lbGY6IFBsdWcgbWVtbGVhayBpbiBRRU1VX0VsZl9pbml0DQo+ICAgZWxmMmRtcC9w
ZGI6IFBsdWcgbWVtbGVhayBpbiBwZGJfaW5pdF9mcm9tX2ZpbGUNCj4gICBtaWdyYXRpb24vY29s
bzogUGx1ZyBtZW1sZWFrcyBpbiBjb2xvX3Byb2Nlc3NfaW5jb21pbmdfdGhyZWFkDQo+ICAgYmxv
Y2tkZXY6IEZpeCBhIG1lbWxlYWsgaW4gZHJpdmVfYmFja3VwX3ByZXBhcmUoKQ0KPiAgIGJsb2Nr
L2ZpbGUtcG9zaXg6IGZpeCBhIHBvc3NpYmxlIHVuZGVmaW5lZCBiZWhhdmlvcg0KPiANCj4gIGJs
b2NrL2ZpbGUtcG9zaXguYyAgICAgICAgICAgICAgfCAgMiArLQ0KPiAgYmxvY2tkZXYuYyAgICAg
ICAgICAgICAgICAgICAgICB8ICAxICsNCj4gIGNvbnRyaWIvZWxmMmRtcC9wZGIuYyAgICAgICAg
ICAgfCAgMSArDQo+ICBjb250cmliL2VsZjJkbXAvcWVtdV9lbGYuYyAgICAgIHwgIDEgKw0KPiAg
bWlncmF0aW9uL2NvbG8uYyAgICAgICAgICAgICAgICB8ICA1ICsrKystDQo+ICBxZ2EvY2hhbm5l
bC1wb3NpeC5jICAgICAgICAgICAgIHwgIDYgKysrKystDQo+ICB0ZXN0cy9xdGVzdC9taWdyYXRp
b24taGVscGVycy5jIHwgMTYgKysrKysrKysrKysrLS0tLQ0KPiAgNyBmaWxlcyBjaGFuZ2VkLCAy
NSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gLS0NCj4gMi4yMy4wDQoNCg==


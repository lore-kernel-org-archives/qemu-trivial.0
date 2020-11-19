Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kffPs-0002Ee-SC
	for mharc-qemu-trivial@gnu.org; Thu, 19 Nov 2020 03:35:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kffPr-0002DU-1l; Thu, 19 Nov 2020 03:35:43 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kffPn-0007Nt-UG; Thu, 19 Nov 2020 03:35:42 -0500
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CcCfq1STyzXnn1;
 Thu, 19 Nov 2020 16:35:15 +0800 (CST)
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.128]) by
 DGGEMM402-HUB.china.huawei.com ([10.3.20.210]) with mapi id 14.03.0487.000;
 Thu, 19 Nov 2020 16:35:21 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: QEMU Developers <qemu-devel@nongnu.org>, QEMU Trivial
 <qemu-trivial@nongnu.org>, Hao Wu <wuhaotsh@google.com>, Havard Skinnemoen
 <hskinnemoen@google.com>, Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, "Euler
 Robot" <euler.robot@huawei.com>
Subject: RE: [PATCH-for-5.2? 1/2] tests/qtest: variable defined by
 g_autofree need to be initialized
Thread-Topic: [PATCH-for-5.2? 1/2] tests/qtest: variable defined by
 g_autofree need to be initialized
Thread-Index: AQHWvaH7LAlqtNTNq0CJSxOYz75c7KnOmeyAgACGw+A=
Date: Thu, 19 Nov 2020 08:35:20 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BA86327@dggemm531-mbx.china.huawei.com>
References: <20201118115646.2461726-1-kuhn.chenqun@huawei.com>
 <20201118115646.2461726-2-kuhn.chenqun@huawei.com>
 <CAFEAcA81CeW=RdrABuAZx2pL6L-nE_AaQ2vbryqm7amUbRjM-g@mail.gmail.com>
In-Reply-To: <CAFEAcA81CeW=RdrABuAZx2pL6L-nE_AaQ2vbryqm7amUbRjM-g@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.149]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga01-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:35:31
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 19 Nov 2020 08:35:43 -0000

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRlciBNYXlkZWxsIFttYWls
dG86cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnXQ0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIg
MTksIDIwMjAgNDoyNiBQTQ0KPiBUbzogQ2hlbnF1biAoa3VobikgPGt1aG4uY2hlbnF1bkBodWF3
ZWkuY29tPg0KPiBDYzogUUVNVSBEZXZlbG9wZXJzIDxxZW11LWRldmVsQG5vbmdudS5vcmc+OyBR
RU1VIFRyaXZpYWwNCj4gPHFlbXUtdHJpdmlhbEBub25nbnUub3JnPjsgSGFvIFd1IDx3dWhhb3Rz
aEBnb29nbGUuY29tPjsgSGF2YXJkDQo+IFNraW5uZW1vZW4gPGhza2lubmVtb2VuQGdvb2dsZS5j
b20+OyBaaGFuZ2hhaWxpYW5nDQo+IDx6aGFuZy56aGFuZ2hhaWxpYW5nQGh1YXdlaS5jb20+OyBU
aG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT47DQo+IExhdXJlbnQgVml2aWVyIDxsdml2aWVy
QHJlZGhhdC5jb20+OyBFdWxlciBSb2JvdCA8ZXVsZXIucm9ib3RAaHVhd2VpLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSC1mb3ItNS4yPyAxLzJdIHRlc3RzL3F0ZXN0OiB2YXJpYWJsZSBkZWZp
bmVkIGJ5IGdfYXV0b2ZyZWUNCj4gbmVlZCB0byBiZSBpbml0aWFsaXplZA0KPiANCj4gT24gV2Vk
LCAxOCBOb3YgMjAyMCBhdCAxMTo1NywgQ2hlbiBRdW4gPGt1aG4uY2hlbnF1bkBodWF3ZWkuY29t
Pg0KPiB3cm90ZToNCj4gPg0KPiA+IEFjY29yZGluZyB0byB0aGUgZ2xpYiBmdW5jdGlvbiByZXF1
aXJlbWVudHMsIHdlIG5lZWQgaW5pdGlhbGlzZSAgdGhlDQo+ID4gdmFyaWFibGUuIE90aGVyd2lz
ZSB0aGVyZSB3aWxsIGJlIGNvbXBpbGF0aW9uIHdhcm5pbmdzOg0KPiA+DQo+ID4gZ2xpYi1hdXRv
Y2xlYW51cHMuaDoyODozOiB3YXJuaW5nOiDigJhmdWxsX25hbWXigJkgbWF5IGJlIHVzZWQNCj4g
PiB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24gWy1XbWF5YmUtdW5pbml0aWFsaXplZF0N
Cj4gPiAgICAyOCB8ICAgZ19mcmVlICgqcHApOw0KPiA+ICAgICAgIHwgICBefn5+fn5+fn5+fn4N
Cj4gPg0KPiA+ICBzdGF0aWMgdm9pZCB0aW1fYWRkX3Rlc3QoY29uc3QgY2hhciAqbmFtZSwgY29u
c3QgVGVzdERhdGEgKnRkLA0KPiA+IEdUZXN0RGF0YUZ1bmMgZm4pICB7DQo+ID4gLSAgICBnX2F1
dG9mcmVlIGNoYXIgKmZ1bGxfbmFtZTsNCj4gPiAtDQo+ID4gLSAgICBmdWxsX25hbWUgPSBnX3N0
cmR1cF9wcmludGYoIm5wY203eHhfdGltZXIvdGltWyVkXS90aW1lclslZF0vJXMiLA0KPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRpbV9pbmRleCh0ZC0+dGltKSwNCj4gdGlt
ZXJfaW5kZXgodGQtPnRpbWVyKSwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBuYW1lKTsNCj4gPiArICAgIGdfYXV0b2ZyZWUgY2hhciAqZnVsbF9uYW1lID0gZ19zdHJkdXBf
cHJpbnRmKA0KPiA+ICsgICAgICAgICJucGNtN3h4X3RpbWVyL3RpbVslZF0vdGltZXJbJWRdLyVz
IiwgdGltX2luZGV4KHRkLT50aW0pLA0KPiA+ICsgICAgICAgIHRpbWVyX2luZGV4KHRkLT50aW1l
ciksIG5hbWUpOw0KPiANCj4gV2hpY2ggY29tcGlsZXIgaXMgc28gdW5pbnRlbGxpZ2VudCB0aGF0
IGl0IGNhbm5vdCBzZWUgdGhhdCBhIGRlY2xhcmF0aW9uDQo+IGltbWVkaWF0ZWx5IGZvbGxvd2Vk
IGJ5IGFuIGFzc2lnbm1lbnQgbXVzdCBhbHdheXMgaW5pdGlhbGl6ZSB0aGUgdmFyaWFibGUgPz8/
DQo+IA0KSGkgUGV0ZXIsDQogIEdsaWIgcmVxdWlyZXMgdGhhdCBhbGwgZ19hdXRvKiBtYWNyb3Mg
bXVzdCBiZSBpbml0aWFsaXplZC4NCiAgaHR0cHM6Ly9kZXZlbG9wZXIuZ25vbWUub3JnL2dsaWIv
c3RhYmxlL2dsaWItTWlzY2VsbGFuZW91cy1NYWNyb3MuaHRtbCNnLWF1dG9mcmVlDQoNClRoYW5r
cywNCkNoZW4gUXVuDQoNCg0K


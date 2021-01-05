Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kwkVs-0005i7-V3
	for mharc-qemu-trivial@gnu.org; Tue, 05 Jan 2021 06:28:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kwkVq-0005fw-KK; Tue, 05 Jan 2021 06:28:30 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kwkVm-0001CX-8e; Tue, 05 Jan 2021 06:28:30 -0500
Received: from dggemi401-hub.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4D99F43wb6z13dF1;
 Tue,  5 Jan 2021 19:26:48 +0800 (CST)
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.51]) by
 dggemi401-hub.china.huawei.com ([10.3.17.134]) with mapi id 14.03.0509.000;
 Tue, 5 Jan 2021 19:28:11 +0800
From: ganqixin <ganqixin@huawei.com>
To: Thomas Huth <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
CC: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>, Zhanghailiang
 <zhang.zhanghailiang@huawei.com>, Euler Robot <euler.robot@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: RE: [PATCH] qtest/libqtest.c: fix heap-buffer-overflow in
 qtest_cb_for_every_machine()
Thread-Topic: [PATCH] qtest/libqtest.c: fix heap-buffer-overflow in
 qtest_cb_for_every_machine()
Thread-Index: AQHW4qOy1rqRxXUbJEqsjcSBp+bgxqoYRAIAgAChTrA=
Date: Tue, 5 Jan 2021 11:28:11 +0000
Message-ID: <A5B86EC83C48EF4CB2BC58BEF3A2F4960661F098@DGGEMI525-MBS.china.huawei.com>
References: <20210104141025.496193-1-ganqixin@huawei.com>
 <b0426ff0-f33b-dd64-66e5-4937bc3a1be1@redhat.com>
In-Reply-To: <b0426ff0-f33b-dd64-66e5-4937bc3a1be1@redhat.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.159]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255; envelope-from=ganqixin@huawei.com;
 helo=szxga08-in.huawei.com
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
X-List-Received-Date: Tue, 05 Jan 2021 11:28:31 -0000

PiBGcm9tOiBUaG9tYXMgSHV0aCBbbWFpbHRvOnRodXRoQHJlZGhhdC5jb21dDQo+IFNlbnQ6IFR1
ZXNkYXksIEphbnVhcnkgNSwgMjAyMSA1OjQ3IFBNDQo+IFRvOiBnYW5xaXhpbiA8Z2FucWl4aW5A
aHVhd2VpLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsNCj4gcWVtdS10cml2aWFsQG5vbmdu
dS5vcmcNCj4gQ2M6IENoZW5xdW4gKGt1aG4pIDxrdWhuLmNoZW5xdW5AaHVhd2VpLmNvbT47IFpo
YW5naGFpbGlhbmcNCj4gPHpoYW5nLnpoYW5naGFpbGlhbmdAaHVhd2VpLmNvbT47IEV1bGVyIFJv
Ym90DQo+IDxldWxlci5yb2JvdEBodWF3ZWkuY29tPjsgTGF1cmVudCBWaXZpZXIgPGx2aXZpZXJA
cmVkaGF0LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gcXRlc3QvbGlicXRlc3QuYzogZml4
IGhlYXAtYnVmZmVyLW92ZXJmbG93IGluDQo+IHF0ZXN0X2NiX2Zvcl9ldmVyeV9tYWNoaW5lKCkN
Cj4gDQo+IE9uIDA0LzAxLzIwMjEgMTUuMTAsIEdhbiBRaXhpbiB3cm90ZToNCj4gPiBXaGVuIHRo
ZSBsZW5ndGggb2YgbW5hbWUgaXMgbGVzcyB0aGFuIDUsIG1lbWNweSAoInhlbmZ2IiwgbW5hbWUs
IDUpDQo+ID4gd2lsbCBjYXVzZSBoZWFwIGJ1ZmZlciBvdmVyZmxvdy4gVGhlcmVmb3JlLCB1c2Ug
c3RyY21wIHRvIGF2b2lkIHRoaXMNCj4gcHJvYmxlbS4NCj4gPg0KPiA+IFRoZSBhc2FuIHNob3dl
ZCBzdGFjazoNCj4gPg0KPiA+IEVSUk9SOiBBZGRyZXNzU2FuaXRpemVyOiBoZWFwLWJ1ZmZlci1v
dmVyZmxvdyBvbiBhZGRyZXNzDQo+ID4gMHg2MDIwMDAwMGYyZjQgYXQgcGMgMHg3ZjY1ZDhjYzIy
MjUgYnAgMHg3ZmZlOTNjYzVhNjAgc3ANCj4gPiAweDdmZmU5M2NjNTIwOCBSRUFEIG9mIHNpemUg
NSBhdA0KPiA+IDB4NjAyMDAwMDBmMmY0IHRocmVhZCBUMA0KPiA+ICAgICAgIzAgMHg3ZjY1ZDhj
YzIyMjQgaW4gbWVtY21wICgvbGliNjQvbGliYXNhbi5zby41KzB4ZGYyMjQpDQo+ID4gICAgICAj
MSAweDU2MzJjMjBiZTk1YiBpbiBxdGVzdF9jYl9mb3JfZXZlcnlfbWFjaGluZQ0KPiB0ZXN0cy9x
dGVzdC9saWJxdGVzdC5jOjEyODINCj4gPiAgICAgICMyIDB4NTYzMmMyMGI3OTk1IGluIG1haW4g
dGVzdHMvcXRlc3QvdGVzdC1obXAuYzoxNjANCj4gPiAgICAgICMzIDB4N2Y2NWQ4OGZlZDQyIGlu
IF9fbGliY19zdGFydF9tYWluICgvbGliNjQvbGliYy5zby42KzB4MjZkNDIpDQo+ID4gICAgICAj
NCAweDU2MzJjMjBiNzJjZCBpbiBfc3RhcnQgKGJ1aWxkL3Rlc3RzL3F0ZXN0L3Rlc3QtaG1wKzB4
NTQyY2QpDQo+ID4NCj4gPiBSZXBvcnRlZC1ieTogRXVsZXIgUm9ib3QgPGV1bGVyLnJvYm90QGh1
YXdlaS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogR2FuIFFpeGluIDxnYW5xaXhpbkBodWF3ZWku
Y29tPg0KPiA+IC0tLQ0KPiA+IENjOiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4NCj4g
PiBDYzogTGF1cmVudCBWaXZpZXIgPGx2aXZpZXJAcmVkaGF0LmNvbT4NCj4gPiAtLS0NCj4gPiAg
IHRlc3RzL3F0ZXN0L2xpYnF0ZXN0LmMgfCAyICstDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9x
dGVzdC9saWJxdGVzdC5jIGIvdGVzdHMvcXRlc3QvbGlicXRlc3QuYyBpbmRleA0KPiA+IGU0OWYz
YTFlNDUuLmU4MTc5YTM1MDkgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvcXRlc3QvbGlicXRlc3Qu
Yw0KPiA+ICsrKyBiL3Rlc3RzL3F0ZXN0L2xpYnF0ZXN0LmMNCj4gPiBAQCAtMTI4MSw3ICsxMjgx
LDcgQEAgdm9pZCBxdGVzdF9jYl9mb3JfZXZlcnlfbWFjaGluZSh2b2lkDQo+ICgqY2IpKGNvbnN0
IGNoYXIgKm1hY2hpbmUpLA0KPiA+ICAgICAgICAgICBnX2Fzc2VydChxc3RyKTsNCj4gPiAgICAg
ICAgICAgbW5hbWUgPSBxc3RyaW5nX2dldF9zdHIocXN0cik7DQo+ID4gICAgICAgICAgIC8qIEln
bm9yZSBtYWNoaW5lcyB0aGF0IGNhbm5vdCBiZSB1c2VkIGZvciBxdGVzdHMgKi8NCj4gPiAtICAg
ICAgICBpZiAoIW1lbWNtcCgieGVuZnYiLCBtbmFtZSwgNSkgfHwgZ19zdHJfZXF1YWwoInhlbnB2
IiwNCj4gbW5hbWUpKSB7DQo+ID4gKyAgICAgICAgaWYgKCFzdHJjbXAoInhlbmZ2IiwgbW5hbWUp
IHx8IGdfc3RyX2VxdWFsKCJ4ZW5wdiIsIG1uYW1lKSkgew0KPiANCj4gVXNpbmcgc3RyY21wKCkg
aXMgbGlrZWx5IHdyb25nIGhlcmUsIHNpbmNlIHdlJ3JlIHRhbGtpbmcgYWJvdXQgc3RyaW5ncyBs
aWtlDQo+ICJ4ZW5mdi00LjIiIGhlcmUgLi4uIHNvIEkgZ3Vlc3Mgc3RybmNtcCguLi4sIDUpIHdv
dWxkIGJlIHRoZSByaWdodCB3YXkgdG8gZ28/DQoNCg0KWWVzLCB1c2luZyBzdHJjbXAoKSBpcyB3
cm9uZywgSSB3aWxsIG1vZGlmeSB0aGlzIHBhdGNoLiBUaGFua3MgZm9yIHlvdXIgcmVwbHkhDQo=


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iaE0K-0003p2-GZ
	for mharc-qemu-trivial@gnu.org; Thu, 28 Nov 2019 02:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47129)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <arei.gonglei@huawei.com>) id 1iaE0I-0003kv-HH
 for qemu-trivial@nongnu.org; Thu, 28 Nov 2019 02:14:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <arei.gonglei@huawei.com>) id 1iaE0H-0008A1-DP
 for qemu-trivial@nongnu.org; Thu, 28 Nov 2019 02:14:18 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2483 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <arei.gonglei@huawei.com>)
 id 1iaE0E-0007ka-Id; Thu, 28 Nov 2019 02:14:14 -0500
Received: from DGGEML401-HUB.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id 8089BB7CAB5F298D1177;
 Thu, 28 Nov 2019 15:14:02 +0800 (CST)
Received: from DGGEML511-MBX.china.huawei.com ([169.254.1.151]) by
 DGGEML401-HUB.china.huawei.com ([fe80::89ed:853e:30a9:2a79%31]) with mapi id
 14.03.0439.000; Thu, 28 Nov 2019 15:13:53 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "marcandre.lureau@gmail.com" <marcandre.lureau@gmail.com>,
 "philmd@redhat.com" <philmd@redhat.com>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>
Subject: RE: [PATCH v6] backends/cryptodev: drop local_err from
 cryptodev_backend_complete()
Thread-Topic: [PATCH v6] backends/cryptodev: drop local_err from
 cryptodev_backend_complete()
Thread-Index: AQHVpVtFP2rZkz4m50KfOlRvg42c16egKx1A
Date: Thu, 28 Nov 2019 07:13:53 +0000
Message-ID: <33183CC9F5247A488A2544077AF19020DB5A1062@dggeml511-mbx.china.huawei.com>
References: <20191127194541.24304-1-vsementsov@virtuozzo.com>
In-Reply-To: <20191127194541.24304-1-vsementsov@virtuozzo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.133.225.234]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.188
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
X-List-Received-Date: Thu, 28 Nov 2019 07:14:19 -0000

Q0NpbmcgcWVtdS10cml2aWFsQG5vbmdudS5vcmcNCg0KUmV2aWV3ZWQtYnk6IEdvbmdsZWkgPGFy
ZWkuZ29uZ2xlaUBodWF3ZWkuY29tPg0KDQoNClJlZ2FyZHMsDQotR29uZ2xlaQ0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNr
aXkgW21haWx0bzp2c2VtZW50c292QHZpcnR1b3p6by5jb21dDQo+IFNlbnQ6IFRodXJzZGF5LCBO
b3ZlbWJlciAyOCwgMjAxOSAzOjQ2IEFNDQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4g
Q2M6IEdvbmdsZWkgKEFyZWkpIDxhcmVpLmdvbmdsZWlAaHVhd2VpLmNvbT47IG1hcmNhbmRyZS5s
dXJlYXVAZ21haWwuY29tOw0KPiBwaGlsbWRAcmVkaGF0LmNvbTsgdnNlbWVudHNvdkB2aXJ0dW96
em8uY29tDQo+IFN1YmplY3Q6IFtQQVRDSCB2Nl0gYmFja2VuZHMvY3J5cHRvZGV2OiBkcm9wIGxv
Y2FsX2VyciBmcm9tDQo+IGNyeXB0b2Rldl9iYWNrZW5kX2NvbXBsZXRlKCkNCj4gDQo+IE5vIHJl
YXNvbiBmb3IgbG9jYWxfZXJyIGhlcmUsIHVzZSBlcnJwIGRpcmVjdGx5IGluc3RlYWQuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBTZW1lbnRzb3YtT2dpZXZza2l5IDx2c2VtZW50c292
QHZpcnR1b3p6by5jb20+DQo+IFJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8
cGhpbG1kQHJlZGhhdC5jb20+DQo+IFJldmlld2VkLWJ5OiBNYXJjLUFuZHLDqSBMdXJlYXUgPG1h
cmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbT4NCj4gLS0tDQo+IA0KPiB2NjogYWRkIHItYiBieSBQ
aGlsaXBwZSBhbmQgTWFyYy1BbmRyw6kNCj4gDQo+ICBiYWNrZW5kcy9jcnlwdG9kZXYuYyB8IDEx
ICstLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEwIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2JhY2tlbmRzL2NyeXB0b2Rldi5jIGIvYmFja2Vu
ZHMvY3J5cHRvZGV2LmMgaW5kZXgNCj4gM2MwNzFlYWI5NS4uNWE5NzM1Njg0ZSAxMDA2NDQNCj4g
LS0tIGEvYmFja2VuZHMvY3J5cHRvZGV2LmMNCj4gKysrIGIvYmFja2VuZHMvY3J5cHRvZGV2LmMN
Cj4gQEAgLTE3NiwxOSArMTc2LDEwIEBAIGNyeXB0b2Rldl9iYWNrZW5kX2NvbXBsZXRlKFVzZXJD
cmVhdGFibGUgKnVjLA0KPiBFcnJvciAqKmVycnApICB7DQo+ICAgICAgQ3J5cHRvRGV2QmFja2Vu
ZCAqYmFja2VuZCA9IENSWVBUT0RFVl9CQUNLRU5EKHVjKTsNCj4gICAgICBDcnlwdG9EZXZCYWNr
ZW5kQ2xhc3MgKmJjID0gQ1JZUFRPREVWX0JBQ0tFTkRfR0VUX0NMQVNTKHVjKTsNCj4gLSAgICBF
cnJvciAqbG9jYWxfZXJyID0gTlVMTDsNCj4gDQo+ICAgICAgaWYgKGJjLT5pbml0KSB7DQo+IC0g
ICAgICAgIGJjLT5pbml0KGJhY2tlbmQsICZsb2NhbF9lcnIpOw0KPiAtICAgICAgICBpZiAobG9j
YWxfZXJyKSB7DQo+IC0gICAgICAgICAgICBnb3RvIG91dDsNCj4gLSAgICAgICAgfQ0KPiArICAg
ICAgICBiYy0+aW5pdChiYWNrZW5kLCBlcnJwKTsNCj4gICAgICB9DQo+IC0NCj4gLSAgICByZXR1
cm47DQo+IC0NCj4gLW91dDoNCj4gLSAgICBlcnJvcl9wcm9wYWdhdGUoZXJycCwgbG9jYWxfZXJy
KTsNCj4gIH0NCj4gDQo+ICB2b2lkIGNyeXB0b2Rldl9iYWNrZW5kX3NldF91c2VkKENyeXB0b0Rl
dkJhY2tlbmQgKmJhY2tlbmQsIGJvb2wgdXNlZCkNCj4gLS0NCj4gMi4yMS4wDQoNCg==


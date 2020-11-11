Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kcmSo-0002J0-6P
	for mharc-qemu-trivial@gnu.org; Wed, 11 Nov 2020 04:30:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kcmSl-0002Hn-KC; Wed, 11 Nov 2020 04:30:48 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kcmSf-0000u9-La; Wed, 11 Nov 2020 04:30:47 -0500
Received: from dggemi405-hub.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CWKG84DRbzXlSB;
 Wed, 11 Nov 2020 17:30:24 +0800 (CST)
Received: from DGGEMI422-HUB.china.huawei.com (10.1.199.151) by
 dggemi405-hub.china.huawei.com (10.3.17.143) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Wed, 11 Nov 2020 17:30:30 +0800
Received: from DGGEMI525-MBS.china.huawei.com ([169.254.6.227]) by
 dggemi422-hub.china.huawei.com ([10.1.199.151]) with mapi id 14.03.0487.000;
 Wed, 11 Nov 2020 17:30:22 +0800
From: ganqixin <ganqixin@huawei.com>
To: Thomas Huth <thuth@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
CC: Zhanghailiang <zhang.zhanghailiang@huawei.com>, "laurent@vivier.eu"
 <laurent@vivier.eu>, "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>,
 "philmd@redhat.com" <philmd@redhat.com>, Chetan Pant
 <chetan4windows@gmail.com>
Subject: RE: [PATCH 0/3] Fix LGPL information in the file headers
Thread-Topic: [PATCH 0/3] Fix LGPL information in the file headers
Thread-Index: AQHWuAtEujdWqFiOOEije/TEChsFjanCIjqAgACG+IA=
Date: Wed, 11 Nov 2020 09:30:21 +0000
Message-ID: <A5B86EC83C48EF4CB2BC58BEF3A2F496065A6206@DGGEMI525-MBS.china.huawei.com>
References: <20201110184223.549499-1-ganqixin@huawei.com>
 <6b4c64b8-b3fa-8388-c750-4a918480bf1b@redhat.com>
In-Reply-To: <6b4c64b8-b3fa-8388-c750-4a918480bf1b@redhat.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.159]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=ganqixin@huawei.com;
 helo=szxga01-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 04:30:36
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
X-List-Received-Date: Wed, 11 Nov 2020 09:30:49 -0000

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUaG9tYXMgSHV0aCBbbWFpbHRv
OnRodXRoQHJlZGhhdC5jb21dDQo+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMTEsIDIwMjAg
NToyMyBQTQ0KPiBUbzogZ2FucWl4aW4gPGdhbnFpeGluQGh1YXdlaS5jb20+OyBxZW11LWRldmVs
QG5vbmdudS5vcmc7DQo+IHFlbXUtdHJpdmlhbEBub25nbnUub3JnDQo+IENjOiBaaGFuZ2hhaWxp
YW5nIDx6aGFuZy56aGFuZ2hhaWxpYW5nQGh1YXdlaS5jb20+OyBsYXVyZW50QHZpdmllci5ldTsN
Cj4gQ2hlbnF1biAoa3VobikgPGt1aG4uY2hlbnF1bkBodWF3ZWkuY29tPjsgcGhpbG1kQHJlZGhh
dC5jb207DQo+IENoZXRhbiBQYW50IDxjaGV0YW40d2luZG93c0BnbWFpbC5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggMC8zXSBGaXggTEdQTCBpbmZvcm1hdGlvbiBpbiB0aGUgZmlsZSBoZWFk
ZXJzDQo+IA0KPiBPbiAxMC8xMS8yMDIwIDE5LjQyLCBHYW4gUWl4aW4gd3JvdGU6DQo+ID4gSGkg
YWxsLA0KPiA+IEkgc2F3IHNvbWUgdGFza3MgdG8gcmVwbGFjZSAiTEdQTCB2ZXJzaW9uIDIiIHdp
dGggIkxHUEwgdmVyc2lvbiAyLjEiIGluDQo+IEJpdGVTaXplZFRhc2tzLiBTbyBJIG1vZGlmaWVk
IHRoZSBmaWxlIGluIHRoZSB0ZXN0IGZvbGRlciB0aGF0IGNvbnRhaW5zICJMR1BMDQo+IHZlcnNp
b24gMiIuDQo+IA0KPiBUaGFua3MsIGJ1dCBiZWZvcmUgeW91IGNvbnRpbnVlIGhlcmUgLi4uIHRo
ZXJlIHdlcmUgYWxyZWFkeSBzb21lIHBhdGNoZXMgZm9yDQo+IHRoaXMgcmVjZW50bHkgb24gdGhl
IGxpc3QsIGxvb2sgZm9yIHRoZSAiRml4IExlc3NlciBHUEwgdmVyc2lvbiBudW1iZXIiDQo+IHBh
dGNoIHNlcmllcyBmcm9tIENoZXRhbiBQYW50IC4uLiBJIHRoaW5rIHNvbWUgb2YgdGhlbSBnb3Qg
bWVyZ2VkIGFscmVhZHksDQo+IGJ1dCBzb21lIGFyZSBzdGlsbCBwZW5kaW5nLi4uDQo+IA0KVGhh
bmtzLCBJIGdvdCBpdC4gSSB3aWxsIHRyeSBzb21lIG90aGVyIHRhc2tzIDopDQoNCkdhbiBRaXhp
bg0K


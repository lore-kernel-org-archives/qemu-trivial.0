Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aqYM1-0002o9-Gv
	for mharc-qemu-trivial@gnu.org; Wed, 13 Apr 2016 23:54:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1aqYLy-0002hx-MA
	for qemu-trivial@nongnu.org; Wed, 13 Apr 2016 23:54:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1aqYLx-0000VO-R9
	for qemu-trivial@nongnu.org; Wed, 13 Apr 2016 23:54:02 -0400
Received: from [59.151.112.132] (port=45925 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>)
	id 1aqYLr-0000Ul-TD; Wed, 13 Apr 2016 23:53:56 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5584262"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Apr 2016 11:53:51 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D05B342B55E4;
	Thu, 14 Apr 2016 11:53:47 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0279.002; Thu, 14 Apr 2016 11:53:47 +0800
From: "Wei, Jiangang" <weijg.fnst@cn.fujitsu.com>
To: "Xie, Changlong" <xiecl.fnst@cn.fujitsu.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
	<qemu-trivial@nongnu.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>
Thread-Topic: [Qemu-devel] [PATCH] accel: make configure_accelerator return
	void
Thread-Index: AQHRlf4v+N/d891enUCBioZvZKzYH5+IUGOA
Date: Thu, 14 Apr 2016 03:53:46 +0000
Message-ID: <1460606025.2269.34.camel@localhost>
References: <1458036463-20180-1-git-send-email-weijg.fnst@cn.fujitsu.com>
	<1460603955.2269.29.camel@localhost> <570F0FDB.2080701@cn.fujitsu.com>
In-Reply-To: <570F0FDB.2080701@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.50]
Content-Type: text/plain; charset="utf-8"
Content-ID: <1585F95AC63C7B4E9F5D7424CA36395D@fujitsu.local>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-yoursite-MailScanner-ID: D05B342B55E4.A6EC0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: weijg.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] accel: make
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
X-List-Received-Date: Thu, 14 Apr 2016 03:54:03 -0000

T24gVGh1LCAyMDE2LTA0LTE0IGF0IDExOjM0ICswODAwLCBDaGFuZ2xvbmcg
WGllIHdyb3RlOg0KPiBPbiAwNC8xNC8yMDE2IDExOjE5IEFNLCBXZWksIEpp
YW5nYW5nIHdyb3RlOg0KPiA+IHBpbmcuLi4NCj4gPiBBbnkgY29tbWVudHM/
DQo+ID4gT24gVHVlLCAyMDE2LTAzLTE1IGF0IDE4OjA3ICswODAwLCBXZWkg
Smlhbmdhbmcgd3JvdGU6DQo+ID4+IFJldHVybiB0aGUgbmVnYXRlZCB2YWx1
ZSBvZiBhY2NlbF9pbml0aWFsaXNlZCBpcyBtZWFuaW5nbGVzcywNCj4gPj4g
YW5kIHRoZSBjYWxsZXIgdmwgZG9lc24ndCBjaGVjayBpdC4NCj4gPj4NCj4g
Pj4gU2lnbmVkLW9mZi1ieTogV2VpIEppYW5nYW5nIDx3ZWlqZy5mbnN0QGNu
LmZ1aml0c3UuY29tPg0KPiA+PiAtLS0NCj4gPj4gICBhY2NlbC5jIHwgNCAr
LS0tDQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAz
IGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvYWNjZWwu
YyBiL2FjY2VsLmMNCj4gPj4gaW5kZXggMDUxMGI5MC4uNDAzZWI1ZSAxMDA2
NDQNCj4gPj4gLS0tIGEvYWNjZWwuYw0KPiA+PiArKysgYi9hY2NlbC5jDQo+
ID4+IEBAIC03Nyw3ICs3Nyw3IEBAIHN0YXRpYyBpbnQgYWNjZWxfaW5pdF9t
YWNoaW5lKEFjY2VsQ2xhc3MgKmFjYywgTWFjaGluZVN0YXRlICptcykNCj4g
Pj4gICAgICAgcmV0dXJuIHJldDsNCj4gPj4gICB9DQo+ID4+DQo+ID4+IC1p
bnQgY29uZmlndXJlX2FjY2VsZXJhdG9yKE1hY2hpbmVTdGF0ZSAqbXMpDQo+
ID4+ICt2b2lkIGNvbmZpZ3VyZV9hY2NlbGVyYXRvcihNYWNoaW5lU3RhdGUg
Km1zKQ0KPiA+PiAgIHsNCj4gPj4gICAgICAgY29uc3QgY2hhciAqcDsNCj4g
Pj4gICAgICAgY2hhciBidWZbMTBdOw0KPiA+PiBAQCAtMTI4LDggKzEyOCw2
IEBAIGludCBjb25maWd1cmVfYWNjZWxlcmF0b3IoTWFjaGluZVN0YXRlICpt
cykNCj4gPj4gICAgICAgaWYgKGluaXRfZmFpbGVkKSB7DQo+ID4+ICAgICAg
ICAgICBmcHJpbnRmKHN0ZGVyciwgIkJhY2sgdG8gJXMgYWNjZWxlcmF0b3Iu
XG4iLCBhY2MtPm5hbWUpOw0KPiA+PiAgICAgICB9DQo+ID4+IC0NCj4gPj4g
LSAgICByZXR1cm4gIWFjY2VsX2luaXRpYWxpc2VkOw0KPiA+PiAgIH0NCj4g
DQo+IEhhdmUgeW91IGNvbXBpbGVkIHRoZSBjb2RlIHdpdGggdGhpcyBwYXRo
Pw0KDQpUaGFua3MgZm9yIHlvdXIgcmVtaW5kLg0KSSBjb21waWxlZCBpdCwN
CkJ1dCAgSSBmb3Jnb3QgdG8gYWRkIHRoZSBjaGFuZ2VkIGhlYWQgZmlsZSB0
b2dldGhlciB3aXRoIGFjY2VsLmMuDQoNCkkgd2lsbCByZXNlbmQgdGhlIHNl
Y29uZCB2ZXJzaW9uLg0KDQpSZWdhcmRzLA0Kd2VpDQo+IA0KPiBUaGFua3MN
Cj4gCS1YaWUNCj4gPj4NCj4gPj4NCj4gPg0KPiA+DQo+ID4NCg0KCgo=


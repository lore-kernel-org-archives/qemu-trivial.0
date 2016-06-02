Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b8IwD-0007xR-3q
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jun 2016 23:04:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1b8IwA-0007v1-Bl
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 23:04:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1b8Iw8-0001QK-Bw
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 23:04:45 -0400
Received: from [59.151.112.132] (port=46645 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>)
	id 1b8Iw1-0001Mp-2I; Wed, 01 Jun 2016 23:04:37 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="7225691"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jun 2016 11:04:25 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 27259498F592;
	Thu,  2 Jun 2016 11:04:21 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0279.002; Thu, 2 Jun 2016 11:04:21 +0800
From: "Wei, Jiangang" <weijg.fnst@cn.fujitsu.com>
To: "famz@redhat.com" <famz@redhat.com>
CC: "kwolf@redhat.com" <kwolf@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, 
	"qemu-block@nongnu.org" <qemu-block@nongnu.org>, "mreitz@redhat.com"
	<mreitz@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH] block/raw-posix: Fix error_report of
	mounting message
Thread-Index: AQHRu9aCcVUaT6bryEWUHdJeh5s5wp/U+NkA
Date: Thu, 2 Jun 2016 03:04:20 +0000
Message-ID: <1464836600.5185.7.camel@localhost>
References: <1464764901-8773-1-git-send-email-weijg.fnst@cn.fujitsu.com>
	<20160601072326.GF8639@ad.usersys.redhat.com>
In-Reply-To: <20160601072326.GF8639@ad.usersys.redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.50]
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB76C3888C394F459BFB54E50E402B4D@fujitsu.local>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 27259498F592.A80AA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: weijg.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/raw-posix: Fix
 error_report of mounting message
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
X-List-Received-Date: Thu, 02 Jun 2016 03:04:47 -0000

T24gV2VkLCAyMDE2LTA2LTAxIGF0IDE1OjIzICswODAwLCBGYW0gWmhlbmcg
d3JvdGU6DQo+IE9uIFdlZCwgMDYvMDEgMTU6MDgsIFdlaSBKaWFuZ2FuZyB3
cm90ZToNCj4gPiBVc2UgYSBzaW5nbGUgZXJyb3JfcHJpbnRmIHRvIHJlcGxh
Y2UgdHJpcGxlIGVycm9yX3JlcG9ydC4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBXZWkgSmlhbmdhbmcgPHdlaWpnLmZuc3RAY24uZnVqaXRzdS5jb20+
DQo+ID4gLS0tDQo+ID4gIGJsb2NrL3Jhdy1wb3NpeC5jIHwgMTAgKysrKyst
LS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9ibG9jay9y
YXctcG9zaXguYyBiL2Jsb2NrL3Jhdy1wb3NpeC5jDQo+ID4gaW5kZXggYTRm
NWExYi4uMTQxYjAxYSAxMDA2NDQNCj4gPiAtLS0gYS9ibG9jay9yYXctcG9z
aXguYw0KPiA+ICsrKyBiL2Jsb2NrL3Jhdy1wb3NpeC5jDQo+ID4gQEAgLTIw
NjEsMTEgKzIwNjEsMTEgQEAgc3RhdGljIGJvb2wgc2V0dXBfY2Ryb20oY2hh
ciAqYnNkX3BhdGgsIEVycm9yICoqZXJycCkNCj4gPiAgLyogUHJpbnRzIGRp
cmVjdGlvbnMgb24gbW91bnRpbmcgYW5kIHVubW91bnRpbmcgYSBkZXZpY2Ug
Ki8NCj4gPiAgc3RhdGljIHZvaWQgcHJpbnRfdW5tb3VudGluZ19kaXJlY3Rp
b25zKGNvbnN0IGNoYXIgKmZpbGVfbmFtZSkNCj4gPiAgew0KPiA+IC0gICAg
ZXJyb3JfcmVwb3J0KCJJZiBkZXZpY2UgJXMgaXMgbW91bnRlZCBvbiB0aGUg
ZGVza3RvcCwgdW5tb3VudCINCj4gPiAtICAgICAgICAgICAgICAgICAiIGl0
IGZpcnN0IGJlZm9yZSB1c2luZyBpdCBpbiBRRU1VIiwgZmlsZV9uYW1lKTsN
Cj4gPiAtICAgIGVycm9yX3JlcG9ydCgiQ29tbWFuZCB0byB1bm1vdW50IGRl
dmljZTogZGlza3V0aWwgdW5tb3VudERpc2sgJXMiLA0KPiA+IC0gICAgICAg
ICAgICAgICAgIGZpbGVfbmFtZSk7DQo+ID4gLSAgICBlcnJvcl9yZXBvcnQo
IkNvbW1hbmQgdG8gbW91bnQgZGV2aWNlOiBkaXNrdXRpbCBtb3VudERpc2sg
JXMiLCBmaWxlX25hbWUpOw0KPiA+ICsgICAgZXJyb3JfcHJpbnRmKCJJZiBk
ZXZpY2UgJXMgaXMgbW91bnRlZCBvbiB0aGUgZGVza3RvcCwgdW5tb3VudCIN
Cj4gPiArICAgICAgICAiIGl0IGZpcnN0IGJlZm9yZSB1c2luZyBpdCBpbiBR
RU1VXG4iDQo+ID4gKyAgICAgICAgIkNvbW1hbmQgdG8gdW5tb3VudCBkZXZp
Y2U6IGRpc2t1dGlsIHVubW91bnREaXNrICVzXG4iDQo+ID4gKyAgICAgICAg
IkNvbW1hbmQgdG8gbW91bnQgZGV2aWNlOiBkaXNrdXRpbCBtb3VudERpc2sg
JXNcbiIsDQo+ID4gKyAgICAgICAgZmlsZV9uYW1lLCBmaWxlX25hbWUsIGZp
bGVfbmFtZSk7DQo+IA0KPiBJJ2Qgc2F5IGl0J3MgbGVzcyByZWFkYWJsZSB3
aXRoIGEgd29yc2UgYWxpZ25tZW50IHRvIHRoZSBwYXJhbWV0ZXJzLg0KSGks
IEZhbQ0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudC4NCllvdSBtZWFuIGV2
ZXJ5IGVycm9yX3JlcG9ydCgpIGZvbGxvd2VkIGJ5IGZpbGVfbmFtZSBpcyBt
b3JlIHJlYWRhYmxlID8NCm9yIG15IGNvZGVzIGRvc2VuJ3QgZm9sbG93IGEg
Z29vZCBhbGlnbm1lbnQgZm9ybWF077yfDQoNCldlaQ0KPiANCj4gRmFtDQo+
IA0KPiANCg0KCgo=


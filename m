Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7EBS-0005CO-CR
	for mharc-qemu-trivial@gnu.org; Sun, 29 May 2016 23:48:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1b7EBP-0005AF-W9
	for qemu-trivial@nongnu.org; Sun, 29 May 2016 23:48:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1b7EBO-0003Jh-2k
	for qemu-trivial@nongnu.org; Sun, 29 May 2016 23:48:02 -0400
Received: from [59.151.112.132] (port=30782 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>)
	id 1b7EBJ-00039H-2U; Sun, 29 May 2016 23:47:57 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="7086075"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 May 2016 11:47:34 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 54D82489F997;
	Mon, 30 May 2016 11:47:31 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0279.002; Mon, 30 May 2016 11:47:31 +0800
From: "Wei, Jiangang" <weijg.fnst@cn.fujitsu.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"liang.z.li@intel.com" <liang.z.li@intel.com>
Thread-Topic: [Qemu-devel][PATCH] docs/multi-thread-compression: Fix wrong
	command string
Thread-Index: AQHRtNfNFaABcPSRFE+JEgn1BgbIOp/QW+uA
Date: Mon, 30 May 2016 03:47:30 +0000
Message-ID: <1464579993.2577.26.camel@localhost>
References: <1463996637-6952-1-git-send-email-weijg.fnst@cn.fujitsu.com>
In-Reply-To: <1463996637-6952-1-git-send-email-weijg.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.50]
Content-Type: text/plain; charset="utf-8"
Content-ID: <DECD103F9F1B8344BF64A6FA67DFF698@fujitsu.local>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 54D82489F997.A6CE4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: weijg.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel][PATCH]
 docs/multi-thread-compression: Fix wrong command string
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
X-List-Received-Date: Mon, 30 May 2016 03:48:05 -0000

QWRkIHFlbXUtdHJpdmlhbCA8cWVtdS10cml2aWFsQG5vbmdudS5vcmc+DQoN
ClJldmlld2VkLWJ5OiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4N
ClJldmlld2VkLWJ5OiBMaWFuZyBMaSA8bGlhbmcuei5saUBpbnRlbC5jb20+
DQoNClRoYW5rcywNCndlaQ0KDQpPbiBNb24sIDIwMTYtMDUtMjMgYXQgMTc6
NDMgKzA4MDAsIFdlaSBKaWFuZ2FuZyB3cm90ZToNCj4gcy9pbmZvX21pZ3Jh
dGVfY2FwYWJpbGl0aWVzL2luZm8gbWlncmF0ZV9jYXBhYmlsaXRpZXMNCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IFdlaSBKaWFuZ2FuZyA8d2VpamcuZm5zdEBj
bi5mdWppdHN1LmNvbT4NCj4gLS0tDQo+ICBkb2NzL211bHRpLXRocmVhZC1j
b21wcmVzc2lvbi50eHQgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kb2NzL211bHRpLXRocmVhZC1jb21wcmVzc2lvbi50eHQgYi9kb2NzL211
bHRpLXRocmVhZC1jb21wcmVzc2lvbi50eHQNCj4gaW5kZXggM2Q0NzdjMy4u
ZDBjYWFmNyAxMDA2NDQNCj4gLS0tIGEvZG9jcy9tdWx0aS10aHJlYWQtY29t
cHJlc3Npb24udHh0DQo+ICsrKyBiL2RvY3MvbXVsdGktdGhyZWFkLWNvbXBy
ZXNzaW9uLnR4dA0KPiBAQCAtMTEwLDcgKzExMCw3IEBAIFVzYWdlDQo+ICA9
PT09PQ0KPiAgMS4gVmVyaWZ5IGJvdGggdGhlIHNvdXJjZSBhbmQgZGVzdGlu
YXRpb24gUUVNVSBhcmUgYWJsZQ0KPiAgdG8gc3VwcG9ydCB0aGUgbXVsdGlw
bGUgdGhyZWFkIGNvbXByZXNzaW9uIG1pZ3JhdGlvbjoNCj4gLSAgICB7cWVt
dX0gaW5mb19taWdyYXRlX2NhcGFiaWxpdGllcw0KPiArICAgIHtxZW11fSBp
bmZvIG1pZ3JhdGVfY2FwYWJpbGl0aWVzDQo+ICAgICAge3FlbXV9IC4uLiBj
b21wcmVzczogb2ZmIC4uLg0KPiAgDQo+ICAyLiBBY3RpdmF0ZSBjb21wcmVz
c2lvbiBvbiB0aGUgc291cmNlOg0KDQoKCg==


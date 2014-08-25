Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLl6b-000064-SE
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 23:38:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1XLl6U-00005j-PG
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 23:38:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1XLl6O-0006cW-JP
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 23:37:58 -0400
Received: from [59.151.112.132] (port=35119 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>)
	id 1XLl6O-0006cC-8S; Sun, 24 Aug 2014 23:37:52 -0400
X-IronPort-AV: E=Sophos;i="5.04,394,1406563200"; d="scan'208";a="35017115"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Aug 2014 11:34:54 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id s7P3bjes024629;
	Mon, 25 Aug 2014 11:37:45 +0800
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Mon, 25 Aug 2014 11:37:48 +0800
From: "chen.fan.fnst@cn.fujitsu.com" <chen.fan.fnst@cn.fujitsu.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [RESEND v2 0/3] Fix some memory leaks about query
	memdev
Thread-Index: AQHPwBXxHLhMfiHNKU26CwxHlC0BtQ==
Date: Mon, 25 Aug 2014 03:37:48 +0000
Message-ID: <05953EE18EEC9148BE892F38DF8F8E8E6240C8@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <cover.1408344055.git.chen.fan.fnst@cn.fujitsu.com>
In-Reply-To: <cover.1408344055.git.chen.fan.fnst@cn.fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.78]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [RESEND v2 0/3] Fix some memory
 leaks about query memdev
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
X-List-Received-Date: Mon, 25 Aug 2014 03:38:05 -0000

cGluZy4uLgoKVGhpcyBwYXRjaGVzIGhhdmUgYmVlbiByZXZpZXdlZC1ieSwgb25seSBuZWVkIHNv
bWVvbmUgYWNrIGl0LgoKVGhhbmtzLApDaGVuCgpPbiBNb24sIDIwMTQtMDgtMTggYXQgMTQ6NDYg
KzA4MDAsIENoZW4gRmFuIHdyb3RlOiAKPiB3aGVuIHVzaW5nIHZhbGdyaW5kIHRvIHRlc3QgdGhl
IGNvbW1hbmQgInF1ZXJ5IG1lbWRldiIsIEkgaGFkCj4gZm91bmQgc29tZSBtZW1vcnkgbGVha3Mu
IHRoZSB0ZXN0IHJlc3VsdDoKPiAKPiA9PTEzODAyPT0gNCBieXRlcyBpbiAxIGJsb2NrcyBhcmUg
ZGVmaW5pdGVseSBsb3N0IGluIGxvc3MgcmVjb3JkIDEyNSBvZiA4LDUwOAo+ID09MTM4MDI9PSAg
ICBhdCAweDRBMDg5MzQ6IG1hbGxvYyAodmdfcmVwbGFjZV9tYWxsb2MuYzoyOTEpCj4gPT0xMzgw
Mj09ICAgIGJ5IDB4NEEwOEFBODogcmVhbGxvYyAodmdfcmVwbGFjZV9tYWxsb2MuYzo2ODcpCj4g
PT0xMzgwMj09ICAgIGJ5IDB4NjRDNTczNjogZ19yZWFsbG9jIChpbiAvdXNyL2xpYjY0L2xpYmds
aWItMi4wLnNvLjAuMzQwMC4yKQo+ID09MTM4MDI9PSAgICBieSAweDY0REUyMjY6ID8/PyAoaW4g
L3Vzci9saWI2NC9saWJnbGliLTIuMC5zby4wLjM0MDAuMikKPiA9PTEzODAyPT0gICAgYnkgMHg2
NERFMjc5OiBnX3N0cmluZ19zaXplZF9uZXcgKGluIC91c3IvbGliNjQvbGliZ2xpYi0yLjAuc28u
MC4zNDAwLjIpCj4gPT0xMzgwMj09ICAgIGJ5IDB4NDdDRkJCOiBzdHJpbmdfb3V0cHV0X3Zpc2l0
b3JfbmV3IChzdHJpbmctb3V0cHV0LXZpc2l0b3IuYzozNDEpCj4gPT0xMzgwMj09ICAgIGJ5IDB4
M0Y0NTZGOiBvYmplY3RfcHJvcGVydHlfZ2V0X3VpbnQxNkxpc3QgKG9iamVjdC5jOjk3MCkKPiA9
PTEzODAyPT0gICAgYnkgMHgxRTg3NjQ6IHF1ZXJ5X21lbWRldiAobnVtYS5jOjM2MSkKPiA9PTEz
ODAyPT0gICAgYnkgMHgzRjMyNDg6IG9iamVjdF9jaGlsZF9mb3JlYWNoIChvYmplY3QuYzo2ODYp
Cj4gPT0xMzgwMj09ICAgIGJ5IDB4MUU5MTQxOiBxbXBfcXVlcnlfbWVtZGV2IChudW1hLmM6Mzg5
KQo+ID09MTM4MDI9PSAgICBieSAweDJENzlBMDogcW1wX21hcnNoYWxfaW5wdXRfcXVlcnlfbWVt
ZGV2IChxbXAtbWFyc2hhbC5jOjUwNTcpCj4gPT0xMzgwMj09ICAgIGJ5IDB4MUREN0Q3OiBoYW5k
bGVfcW1wX2NvbW1hbmQgKG1vbml0b3IuYzo1MDM4KQo+IAo+ID09MTUwNDY9PSA0OCAoMTYgZGly
ZWN0LCAzMiBpbmRpcmVjdCkgYnl0ZXMgaW4gMSBibG9ja3MgYXJlIGRlZmluaXRlbHkgbG9zdCBp
biBsb3NzIHJlY29yZCA0LDcyMiBvZiA4LDU0OQo+ID09MTUwNDY9PSAgICBhdCAweDRBMDg5MzQ6
IG1hbGxvYyAodmdfcmVwbGFjZV9tYWxsb2MuYzoyOTEpCj4gPT0xNTA0Nj09ICAgIGJ5IDB4NjRD
NTQxRDogPz8/IChpbiAvdXNyL2xpYjY0L2xpYmdsaWItMi4wLnNvLjAuMzQwMC4yKQo+ID09MTUw
NDY9PSAgICBieSAweDY0QzU2RTY6IGdfbWFsbG9jMCAoaW4gL3Vzci9saWI2NC9saWJnbGliLTIu
MC5zby4wLjM0MDAuMikKPiA9PTE1MDQ2PT0gICAgYnkgMHgxRTg2OEM6IHF1ZXJ5X21lbWRldiAo
bnVtYS5jOjMyNSkKPiA9PTE1MDQ2PT0gICAgYnkgMHgzRjMyNTg6IG9iamVjdF9jaGlsZF9mb3Jl
YWNoIChvYmplY3QuYzo2ODYpCj4gPT0xNTA0Nj09ICAgIGJ5IDB4MUU5MTQxOiBxbXBfcXVlcnlf
bWVtZGV2IChudW1hLmM6Mzg5KQo+ID09MTUwNDY9PSAgICBieSAweDJEREZGMzogaG1wX2luZm9f
bWVtZGV2IChobXAuYzoxNjg3KQo+ID09MTUwNDY9PSAgICBieSAweDFFNEIwODogaGFuZGxlX3Vz
ZXJfY29tbWFuZCAobW9uaXRvci5jOjQxMTkpCj4gPT0xNTA0Nj09ICAgIGJ5IDB4MUU0RTdBOiBt
b25pdG9yX2NvbW1hbmRfY2IgKG1vbml0b3IuYzo1MTU2KQo+ID09MTUwNDY9PSAgICBieSAweDQ5
NjA1NjogcmVhZGxpbmVfaGFuZGxlX2J5dGUgKHJlYWRsaW5lLmM6MzkxKQo+ID09MTUwNDY9PSAg
ICBieSAweDFFNEJDRTogbW9uaXRvcl9yZWFkIChtb25pdG9yLmM6NTEzOSkKPiA9PTE1MDQ2PT0g
ICAgYnkgMHgyQkNERUY6IGZkX2Nocl9yZWFkIChxZW11LWNoYXIuYzoyMTMpCj4gCj4gCj4gQ2hl
biBGYW4gKDMpOgo+ICAgcXVlcnktbWVtZGV2OiBmaXggcG90ZW50aWFsIG1lbW9yeSBsZWFrcwo+
ICAgcW9tL29iamVjdC5jOiBmaXggc3RyaW5nX291dHB1dF9nZXRfc3RyaW5nKCkgbWVtb3J5IGxl
YWsKPiAgIGhtcDogZml4IE1lbWRldkxpc3QgbWVtb3J5IGxlYWsKPiAKPiAgaG1wLmMgICAgICAg
IHwgIDggKysrKysrLS0KPiAgbnVtYS5jICAgICAgIHwgMTUgKysrKysrKy0tLS0tLS0tCj4gIHFv
bS9vYmplY3QuYyB8IDEyICsrKysrKysrKystLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDIzIGluc2Vy
dGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+IAoK


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XMoLM-00055i-Ay
	for mharc-qemu-trivial@gnu.org; Wed, 27 Aug 2014 21:17:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1XMoLE-00051E-Bv
	for qemu-trivial@nongnu.org; Wed, 27 Aug 2014 21:17:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1XMoL8-0006kD-6g
	for qemu-trivial@nongnu.org; Wed, 27 Aug 2014 21:17:32 -0400
Received: from [59.151.112.132] (port=47725 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>)
	id 1XMoKv-0006hq-9V; Wed, 27 Aug 2014 21:17:13 -0400
X-IronPort-AV: E=Sophos;i="5.04,414,1406563200"; d="scan'208";a="35171125"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Aug 2014 09:14:11 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id s7S1H2Oq007033;
	Thu, 28 Aug 2014 09:17:03 +0800
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Thu, 28 Aug 2014 09:17:09 +0800
From: "chen.fan.fnst@cn.fujitsu.com" <chen.fan.fnst@cn.fujitsu.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [RESEND v2 0/3] Fix some memory leaks about query
	memdev
Thread-Index: AQHPwl3L+cGfdaeV80uyI4QOtX9lqA==
Date: Thu, 28 Aug 2014 01:17:09 +0000
Message-ID: <05953EE18EEC9148BE892F38DF8F8E8E625B9B@G08CNEXMBPEKD03.g08.fujitsu.local>
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>
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
X-List-Received-Date: Thu, 28 Aug 2014 01:17:38 -0000

cGluZyA/CgpPbiBNb24sIDIwMTQtMDgtMTggYXQgMTQ6NDYgKzA4MDAsIENoZW4gRmFuIHdyb3Rl
OiAKPiB3aGVuIHVzaW5nIHZhbGdyaW5kIHRvIHRlc3QgdGhlIGNvbW1hbmQgInF1ZXJ5IG1lbWRl
diIsIEkgaGFkCj4gZm91bmQgc29tZSBtZW1vcnkgbGVha3MuIHRoZSB0ZXN0IHJlc3VsdDoKPiAK
PiA9PTEzODAyPT0gNCBieXRlcyBpbiAxIGJsb2NrcyBhcmUgZGVmaW5pdGVseSBsb3N0IGluIGxv
c3MgcmVjb3JkIDEyNSBvZiA4LDUwOAo+ID09MTM4MDI9PSAgICBhdCAweDRBMDg5MzQ6IG1hbGxv
YyAodmdfcmVwbGFjZV9tYWxsb2MuYzoyOTEpCj4gPT0xMzgwMj09ICAgIGJ5IDB4NEEwOEFBODog
cmVhbGxvYyAodmdfcmVwbGFjZV9tYWxsb2MuYzo2ODcpCj4gPT0xMzgwMj09ICAgIGJ5IDB4NjRD
NTczNjogZ19yZWFsbG9jIChpbiAvdXNyL2xpYjY0L2xpYmdsaWItMi4wLnNvLjAuMzQwMC4yKQo+
ID09MTM4MDI9PSAgICBieSAweDY0REUyMjY6ID8/PyAoaW4gL3Vzci9saWI2NC9saWJnbGliLTIu
MC5zby4wLjM0MDAuMikKPiA9PTEzODAyPT0gICAgYnkgMHg2NERFMjc5OiBnX3N0cmluZ19zaXpl
ZF9uZXcgKGluIC91c3IvbGliNjQvbGliZ2xpYi0yLjAuc28uMC4zNDAwLjIpCj4gPT0xMzgwMj09
ICAgIGJ5IDB4NDdDRkJCOiBzdHJpbmdfb3V0cHV0X3Zpc2l0b3JfbmV3IChzdHJpbmctb3V0cHV0
LXZpc2l0b3IuYzozNDEpCj4gPT0xMzgwMj09ICAgIGJ5IDB4M0Y0NTZGOiBvYmplY3RfcHJvcGVy
dHlfZ2V0X3VpbnQxNkxpc3QgKG9iamVjdC5jOjk3MCkKPiA9PTEzODAyPT0gICAgYnkgMHgxRTg3
NjQ6IHF1ZXJ5X21lbWRldiAobnVtYS5jOjM2MSkKPiA9PTEzODAyPT0gICAgYnkgMHgzRjMyNDg6
IG9iamVjdF9jaGlsZF9mb3JlYWNoIChvYmplY3QuYzo2ODYpCj4gPT0xMzgwMj09ICAgIGJ5IDB4
MUU5MTQxOiBxbXBfcXVlcnlfbWVtZGV2IChudW1hLmM6Mzg5KQo+ID09MTM4MDI9PSAgICBieSAw
eDJENzlBMDogcW1wX21hcnNoYWxfaW5wdXRfcXVlcnlfbWVtZGV2IChxbXAtbWFyc2hhbC5jOjUw
NTcpCj4gPT0xMzgwMj09ICAgIGJ5IDB4MUREN0Q3OiBoYW5kbGVfcW1wX2NvbW1hbmQgKG1vbml0
b3IuYzo1MDM4KQo+IAo+ID09MTUwNDY9PSA0OCAoMTYgZGlyZWN0LCAzMiBpbmRpcmVjdCkgYnl0
ZXMgaW4gMSBibG9ja3MgYXJlIGRlZmluaXRlbHkgbG9zdCBpbiBsb3NzIHJlY29yZCA0LDcyMiBv
ZiA4LDU0OQo+ID09MTUwNDY9PSAgICBhdCAweDRBMDg5MzQ6IG1hbGxvYyAodmdfcmVwbGFjZV9t
YWxsb2MuYzoyOTEpCj4gPT0xNTA0Nj09ICAgIGJ5IDB4NjRDNTQxRDogPz8/IChpbiAvdXNyL2xp
YjY0L2xpYmdsaWItMi4wLnNvLjAuMzQwMC4yKQo+ID09MTUwNDY9PSAgICBieSAweDY0QzU2RTY6
IGdfbWFsbG9jMCAoaW4gL3Vzci9saWI2NC9saWJnbGliLTIuMC5zby4wLjM0MDAuMikKPiA9PTE1
MDQ2PT0gICAgYnkgMHgxRTg2OEM6IHF1ZXJ5X21lbWRldiAobnVtYS5jOjMyNSkKPiA9PTE1MDQ2
PT0gICAgYnkgMHgzRjMyNTg6IG9iamVjdF9jaGlsZF9mb3JlYWNoIChvYmplY3QuYzo2ODYpCj4g
PT0xNTA0Nj09ICAgIGJ5IDB4MUU5MTQxOiBxbXBfcXVlcnlfbWVtZGV2IChudW1hLmM6Mzg5KQo+
ID09MTUwNDY9PSAgICBieSAweDJEREZGMzogaG1wX2luZm9fbWVtZGV2IChobXAuYzoxNjg3KQo+
ID09MTUwNDY9PSAgICBieSAweDFFNEIwODogaGFuZGxlX3VzZXJfY29tbWFuZCAobW9uaXRvci5j
OjQxMTkpCj4gPT0xNTA0Nj09ICAgIGJ5IDB4MUU0RTdBOiBtb25pdG9yX2NvbW1hbmRfY2IgKG1v
bml0b3IuYzo1MTU2KQo+ID09MTUwNDY9PSAgICBieSAweDQ5NjA1NjogcmVhZGxpbmVfaGFuZGxl
X2J5dGUgKHJlYWRsaW5lLmM6MzkxKQo+ID09MTUwNDY9PSAgICBieSAweDFFNEJDRTogbW9uaXRv
cl9yZWFkIChtb25pdG9yLmM6NTEzOSkKPiA9PTE1MDQ2PT0gICAgYnkgMHgyQkNERUY6IGZkX2No
cl9yZWFkIChxZW11LWNoYXIuYzoyMTMpCj4gCj4gCj4gQ2hlbiBGYW4gKDMpOgo+ICAgcXVlcnkt
bWVtZGV2OiBmaXggcG90ZW50aWFsIG1lbW9yeSBsZWFrcwo+ICAgcW9tL29iamVjdC5jOiBmaXgg
c3RyaW5nX291dHB1dF9nZXRfc3RyaW5nKCkgbWVtb3J5IGxlYWsKPiAgIGhtcDogZml4IE1lbWRl
dkxpc3QgbWVtb3J5IGxlYWsKPiAKPiAgaG1wLmMgICAgICAgIHwgIDggKysrKysrLS0KPiAgbnVt
YS5jICAgICAgIHwgMTUgKysrKysrKy0tLS0tLS0tCj4gIHFvbS9vYmplY3QuYyB8IDEyICsrKysr
KysrKystLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9u
cygtKQo+IAoK


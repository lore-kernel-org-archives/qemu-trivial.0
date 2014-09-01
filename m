Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XOGdN-0000Nj-Oi
	for mharc-qemu-trivial@gnu.org; Sun, 31 Aug 2014 21:42:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1XOGdF-0000M0-Nn
	for qemu-trivial@nongnu.org; Sun, 31 Aug 2014 21:42:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1XOGd9-0004Tp-Il
	for qemu-trivial@nongnu.org; Sun, 31 Aug 2014 21:42:09 -0400
Received: from [59.151.112.132] (port=10586 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>)
	id 1XOGd9-0004Tg-8N; Sun, 31 Aug 2014 21:42:03 -0400
X-IronPort-AV: E=Sophos;i="5.04,439,1406563200"; d="scan'208";a="35316683"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Sep 2014 09:38:58 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id s811fpwj026952;
	Mon, 1 Sep 2014 09:41:51 +0800
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Mon, 1 Sep 2014 09:41:54 +0800
From: "chen.fan.fnst@cn.fujitsu.com" <chen.fan.fnst@cn.fujitsu.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Thread-Topic: [Qemu-trivial] [RESEND v2 0/3] Fix some memory leaks about
	query memdev
Thread-Index: AQHPxYXqox2XXLgpW0i1bcipJpKQqw==
Date: Mon, 1 Sep 2014 01:41:54 +0000
Message-ID: <05953EE18EEC9148BE892F38DF8F8E8E627320@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <cover.1408344055.git.chen.fan.fnst@cn.fujitsu.com>
	<5400AA87.5000904@msgid.tls.msk.ru>
In-Reply-To: <5400AA87.5000904@msgid.tls.msk.ru>
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
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [RESEND v2 0/3] Fix some memory leaks about
 query memdev
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
X-List-Received-Date: Mon, 01 Sep 2014 01:42:16 -0000

T24gRnJpLCAyMDE0LTA4LTI5IGF0IDIwOjI5ICswNDAwLCBNaWNoYWVsIFRva2FyZXYgd3JvdGU6
IAo+IDE4LjA4LjIwMTQgMTA6NDYsIENoZW4gRmFuIHdyb3RlOgo+ID4gd2hlbiB1c2luZyB2YWxn
cmluZCB0byB0ZXN0IHRoZSBjb21tYW5kICJxdWVyeSBtZW1kZXYiLCBJIGhhZAo+ID4gZm91bmQg
c29tZSBtZW1vcnkgbGVha3MuIHRoZSB0ZXN0IHJlc3VsdDoKPiAuLi4KPiAKPiBBcHBsaWVkIGFs
bCAzIHRvIC10cml2aWFsLiAgVXN1YWxseSB0aGVzZSBhcmUgbm90IHJlYWxseSB0cml2aWFsLgo+
IFBsZWFzZSBub3RlIHRoYXQgeW91ciAybmQgcGF0Y2ggLSAicW9tL29iamVjdC5jOiBmaXggc3Ry
aW5nX291dHB1dF9nZXRfc3RyaW5nKCkKPiBtZW1vcnkgbGVhayIgLSBhbHNvIHRvdWNoZXMgaG1w
LmMgKHdoaWNoIGhhcyBhIG1haW50YWluZXIpLCBidXQgeW91Cj4gZGlkbid0IG1lbnRpb24gdGhp
cyBpbiBwYXRjaCBkZXNjcmlwdGlvbi4gIEkndmUgYWRkZWQgaXQuClRoYW5rcywKCkNoZW4KCgo+
IAo+IFRoYW5rcywKPiAKPiAvbWp0Cgo=


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bIySM-0001Cr-6n
	for mharc-qemu-trivial@gnu.org; Fri, 01 Jul 2016 09:26:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <awirth@akamai.com>) id 1bIx6s-0000ml-9S
	for qemu-trivial@nongnu.org; Fri, 01 Jul 2016 07:59:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <awirth@akamai.com>) id 1bIx6r-0003Fz-D3
	for qemu-trivial@nongnu.org; Fri, 01 Jul 2016 07:59:50 -0400
Received: from prod-mail-xrelay08.akamai.com ([96.6.114.112]:16402)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <awirth@akamai.com>)
	id 1bIx6l-0003Ax-JI; Fri, 01 Jul 2016 07:59:43 -0400
Received: from prod-mail-xrelay08.akamai.com (localhost.localdomain
	[127.0.0.1]) by postfix.imss70 (Postfix) with ESMTP id 21234200047;
	Fri,  1 Jul 2016 11:59:40 +0000 (GMT)
Received: from prod-mail-relay08.akamai.com (prod-mail-relay08.akamai.com
	[172.27.22.71])
	by prod-mail-xrelay08.akamai.com (Postfix) with ESMTP id 0AF9F200010;
	Fri,  1 Jul 2016 11:59:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; s=a1;
	t=1467374380; bh=DOJu5MLy034CUEvJW6waAnLXtL0bRectuCkIOBl+cVQ=;
	l=1138; h=From:To:CC:Date:From;
	b=BSiQ2Foz+YobeYoQCj6fPWiN/Dgr2ETqvbkrp60zJaEFEU/Nkn8ZcyrRWvVZTp94B
	Ucv7VpjrF4rE9tOhbGYfnYpAaK42pzgw6Pag2TIol7ptuzf8qSVlvxDKGCqAj6IDJO
	683VKzKSpl0bM4rfJ0YScah/cn5A+IsfBjsRT8lY=
Received: from email.msg.corp.akamai.com (ustx2ex-cas5.msg.corp.akamai.com
	[172.27.25.34])
	by prod-mail-relay08.akamai.com (Postfix) with ESMTP id 080F698082;
	Fri,  1 Jul 2016 11:59:40 +0000 (GMT)
Received: from USTX2EX-DAG1MB3.msg.corp.akamai.com (172.27.27.103) by
	ustx2ex-dag1mb1.msg.corp.akamai.com (172.27.27.101) with Microsoft SMTP
	Server (TLS) id 15.0.1130.7; Fri, 1 Jul 2016 06:59:39 -0500
Received: from USTX2EX-DAG1MB3.msg.corp.akamai.com ([172.27.27.103]) by
	ustx2ex-dag1mb3.msg.corp.akamai.com ([172.27.27.103]) with mapi id
	15.00.1130.005; Fri, 1 Jul 2016 06:59:39 -0500
From: "Wirth, Allan" <awirth@akamai.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Riku Voipio
	<riku.voipio@iki.fi>
CC: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Thread-Topic: [PATCH] linux-user: fix signal() syscall on x86_64
Thread-Index: AQHR05ALwApKz4zPX0yzVa9Bvxt/LQ==
Date: Fri, 1 Jul 2016 11:59:39 +0000
Message-ID: <92770843-66C8-471B-BA9C-DA46E92817B9@akamai.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.19.40.129]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D2EB803AF684F04AA2EF0506C3543F99@akamai.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 96.6.114.112
X-Mailman-Approved-At: Fri, 01 Jul 2016 09:26:05 -0400
Subject: [Qemu-trivial] [PATCH] linux-user: fix signal() syscall on x86_64
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
X-List-Received-Date: Fri, 01 Jul 2016 11:59:51 -0000

TGludXggb24gWDg2XzY0IGRvZXMgbm90IHVzZSBzZWxfYXJnX3N0cnVjdCBmb3Igc2VsZWN0KCks
IHRoZSBhcmdzIGFyZQ0KcGFzc2VkIGRpcmVjdGx5LiBUaGlzIHBhdGNoIHN3aXRjaGVzIGEgZGVm
aW5lIHNvIFg4Nl82NCB1c2VzIHRoZSBjb3JyZWN0DQpjYWxsaW5nIGNvbnZlbnRpb24uDQoNClNp
Z25lZC1vZmYtYnk6IEFsbGFuIFdpcnRoIDxhd2lydGhAYWthbWFpLmNvbT4NCi0tLQ0KIGxpbnV4
LXVzZXIvc3lzY2FsbC5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvbGludXgtdXNlci9zeXNjYWxsLmMgYi9saW51
eC11c2VyL3N5c2NhbGwuYw0KaW5kZXggOGJmNjIwNS4uMjA5YjJhNyAxMDA2NDQNCi0tLSBhL2xp
bnV4LXVzZXIvc3lzY2FsbC5jDQorKysgYi9saW51eC11c2VyL3N5c2NhbGwuYw0KQEAgLTgwMDIs
NyArODAwMiw3IEBAIGFiaV9sb25nIGRvX3N5c2NhbGwodm9pZCAqY3B1X2VudiwgaW50IG51bSwg
YWJpX2xvbmcgYXJnMSwNCiAgICAgICAgIGJyZWFrOw0KICNpZiBkZWZpbmVkKFRBUkdFVF9OUl9z
ZWxlY3QpDQogICAgIGNhc2UgVEFSR0VUX05SX3NlbGVjdDoNCi0jaWYgZGVmaW5lZChUQVJHRVRf
UzM5MFgpIHx8IGRlZmluZWQoVEFSR0VUX0FMUEhBKQ0KKyNpZiBkZWZpbmVkKFRBUkdFVF9TMzkw
WCkgfHwgZGVmaW5lZChUQVJHRVRfQUxQSEEpIHx8IGRlZmluZWQoVEFSR0VUX1g4Nl82NCkNCiAg
ICAgICAgIHJldCA9IGRvX3NlbGVjdChhcmcxLCBhcmcyLCBhcmczLCBhcmc0LCBhcmc1KTsNCiAj
ZWxzZQ0KICAgICAgICAgew0KLS0gDQoxLjkuMQ0KDQo=


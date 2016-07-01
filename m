Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bJ0Sm-0004iY-C4
	for mharc-qemu-trivial@gnu.org; Fri, 01 Jul 2016 11:34:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <awirth@akamai.com>) id 1bJ0Sk-0004ga-1E
	for qemu-trivial@nongnu.org; Fri, 01 Jul 2016 11:34:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <awirth@akamai.com>) id 1bJ0Sh-0006Ue-Rb
	for qemu-trivial@nongnu.org; Fri, 01 Jul 2016 11:34:36 -0400
Received: from prod-mail-xrelay06.akamai.com ([96.6.114.98]:44189)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <awirth@akamai.com>)
	id 1bJ0Sc-0006Tz-RG; Fri, 01 Jul 2016 11:34:31 -0400
Received: from prod-mail-xrelay06.akamai.com (localhost.localdomain
	[127.0.0.1]) by postfix.imss70 (Postfix) with ESMTP id F247B496C07;
	Fri,  1 Jul 2016 15:34:25 +0000 (GMT)
Received: from prod-mail-relay08.akamai.com (prod-mail-relay08.akamai.com
	[172.27.22.71])
	by prod-mail-xrelay06.akamai.com (Postfix) with ESMTP id DC5C4496C04;
	Fri,  1 Jul 2016 15:34:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; s=a1;
	t=1467387265; bh=HuHCmUVg8HK5g9OD9gnJB3S9gz+zMZyIiJB0+dlRg+8=;
	l=2184; h=From:To:CC:Date:References:In-Reply-To:From;
	b=EHXEyJX+EXW2E0b5dDBi6VnHxJV7Hs52/TspfSppcjGWkNdPhq0UGfp0n1vG5XeP7
	aNie/JFWV5XplhAp9j5J6vtfj7gw8tSfKfZve5uZes/uY/KR5pTNWhzaqBDtszliR3
	cOlDhUQhEZWSJQkRdIMtcFcrawrEINoo0QEFhwAw=
Received: from email.msg.corp.akamai.com (ustx2ex-cas1.msg.corp.akamai.com
	[172.27.25.30])
	by prod-mail-relay08.akamai.com (Postfix) with ESMTP id D948598082;
	Fri,  1 Jul 2016 15:34:25 +0000 (GMT)
Received: from USTX2EX-DAG1MB3.msg.corp.akamai.com (172.27.27.103) by
	ustx2ex-dag1mb5.msg.corp.akamai.com (172.27.27.105) with Microsoft SMTP
	Server (TLS) id 15.0.1130.7; Fri, 1 Jul 2016 10:34:25 -0500
Received: from USTX2EX-DAG1MB3.msg.corp.akamai.com ([172.27.27.103]) by
	ustx2ex-dag1mb3.msg.corp.akamai.com ([172.27.27.103]) with mapi id
	15.00.1130.005; Fri, 1 Jul 2016 10:34:25 -0500
From: "Wirth, Allan" <awirth@akamai.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Riku Voipio
	<riku.voipio@iki.fi>, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH] linux-user: fix signal() syscall on x86_64
Thread-Index: AQHR05ALwApKz4zPX0yzVa9Bvxt/LaAD56uA///eDwA=
Date: Fri, 1 Jul 2016 15:34:24 +0000
Message-ID: <6E700AE9-9FC8-4B5A-9065-1772A858EAAA@akamai.com>
References: <92770843-66C8-471B-BA9C-DA46E92817B9@akamai.com>
	<CAFEAcA9VxFBB7BYBWY1gtHeScPkPehoh6SMVY-68UGz6RSFS=g@mail.gmail.com>
In-Reply-To: <CAFEAcA9VxFBB7BYBWY1gtHeScPkPehoh6SMVY-68UGz6RSFS=g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.19.43.125]
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B39BA20989ACC46AB8964FA787FDC99@akamai.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 96.6.114.98
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: fix signal()
 syscall on x86_64
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
X-List-Received-Date: Fri, 01 Jul 2016 15:34:39 -0000

VGhhbmtzIGZvciB0aGUgZmVlZGJhY2suIEkgZGlkbuKAmXQgZmluZCB0aGF0IHBhdGNoIGJlZm9y
ZSB3aGVuIEkgc2VhcmNoZWQsIHNvDQphcG9sb2dpZXMgZm9yIHRoZSBkdXBsaWNhdGUgc3VibWlz
c2lvbi4NCg0KVGhlIHByb3Bvc2VkIGZpeCBjZXJ0YWlubHkgZG9lcyBzZWVtIGNsZWFuZXIgYW5k
IG1vcmUgZ2VuZXJhbC4gRG9lcyBpdA0KaW1wbHkgdGhvdWdoIHRoYXQgdGhpcyBwYXRjaCBpcyBp
bmNvcnJlY3Q/IEl0IGZpeGVzIHRoZSBlbXVsYXRpb24gYnVnDQppbiBteSB1c2UgY2FzZSwgYW5k
IEFGQUlDVCBkb2VzIG5vdCBpbnRyb2R1Y2UgbmV3IGVtdWxhdGlvbiBidWdzLg0KDQpDaGVlcnMs
DQpBbGxhbiBXaXJ0aA0KDQpPbiA3LzEvMTYsIDk6MzUgQU0sICJQZXRlciBNYXlkZWxsIiA8cGV0
ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPiB3cm90ZToNCg0KPk9uIDEgSnVseSAyMDE2IGF0IDEyOjU5
LCBXaXJ0aCwgQWxsYW4gPGF3aXJ0aEBha2FtYWkuY29tPiB3cm90ZToNCj4+IExpbnV4IG9uIFg4
Nl82NCBkb2VzIG5vdCB1c2Ugc2VsX2FyZ19zdHJ1Y3QgZm9yIHNlbGVjdCgpLCB0aGUgYXJncyBh
cmUNCj4+IHBhc3NlZCBkaXJlY3RseS4gVGhpcyBwYXRjaCBzd2l0Y2hlcyBhIGRlZmluZSBzbyBY
ODZfNjQgdXNlcyB0aGUgY29ycmVjdA0KPj4gY2FsbGluZyBjb252ZW50aW9uLg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IEFsbGFuIFdpcnRoIDxhd2lydGhAYWthbWFpLmNvbT4NCj4+IC0tLQ0KPj4g
IGxpbnV4LXVzZXIvc3lzY2FsbC5jIHwgMiArLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9saW51eC11c2VyL3N5
c2NhbGwuYyBiL2xpbnV4LXVzZXIvc3lzY2FsbC5jDQo+PiBpbmRleCA4YmY2MjA1Li4yMDliMmE3
IDEwMDY0NA0KPj4gLS0tIGEvbGludXgtdXNlci9zeXNjYWxsLmMNCj4+ICsrKyBiL2xpbnV4LXVz
ZXIvc3lzY2FsbC5jDQo+PiBAQCAtODAwMiw3ICs4MDAyLDcgQEAgYWJpX2xvbmcgZG9fc3lzY2Fs
bCh2b2lkICpjcHVfZW52LCBpbnQgbnVtLCBhYmlfbG9uZyBhcmcxLA0KPj4gICAgICAgICAgYnJl
YWs7DQo+PiAgI2lmIGRlZmluZWQoVEFSR0VUX05SX3NlbGVjdCkNCj4+ICAgICAgY2FzZSBUQVJH
RVRfTlJfc2VsZWN0Og0KPj4gLSNpZiBkZWZpbmVkKFRBUkdFVF9TMzkwWCkgfHwgZGVmaW5lZChU
QVJHRVRfQUxQSEEpDQo+PiArI2lmIGRlZmluZWQoVEFSR0VUX1MzOTBYKSB8fCBkZWZpbmVkKFRB
UkdFVF9BTFBIQSkgfHwgZGVmaW5lZChUQVJHRVRfWDg2XzY0KQ0KPj4gICAgICAgICAgcmV0ID0g
ZG9fc2VsZWN0KGFyZzEsIGFyZzIsIGFyZzMsIGFyZzQsIGFyZzUpOw0KPj4gICNlbHNlDQo+PiAg
ICAgICAgICB7DQo+DQo+VGhlcmUgaXMgYSBjbGVhbmVyIGFwcHJvYWNoIHdoaWNoIHdlIHNob3Vs
ZCB1c2UgdG8gZml4IHRoaXM6DQo+c2VlIG15IGNvbW1lbnRzIGluIHJlcGx5IHRvIHRoaXMgcmVj
ZW50IHBhdGNoIHRyeWluZyB0byBkbw0KPmEgc2ltaWxhciB0aGluZzoNCj5odHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3BhdGNoLzkxODU5MjcvDQo+DQo+dGhhbmtzDQo+LS0gUE1NDQoNCg==


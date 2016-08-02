Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bUaAR-0000DU-Th
	for mharc-qemu-trivial@gnu.org; Tue, 02 Aug 2016 09:55:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fikshu@tencent.com>) id 1bUX4p-00039n-U0
	for qemu-trivial@nongnu.org; Tue, 02 Aug 2016 06:37:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fikshu@tencent.com>) id 1bUX4j-0007xx-VM
	for qemu-trivial@nongnu.org; Tue, 02 Aug 2016 06:37:34 -0400
Received: from mail4.tencent.com ([183.57.53.109]:59303)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fikshu@tencent.com>)
	id 1bUX4M-0007sp-CA; Tue, 02 Aug 2016 06:37:18 -0400
Received: from EXHUB-SZMAIL02.tencent.com (unknown [10.14.6.23])
	by mail4.tencent.com (Postfix) with ESMTP id 8A592500CA;
	Tue,  2 Aug 2016 18:22:52 +0800 (CST)
Received: from EXHUB-TJ03.tencent.com (10.14.134.21) by
	EXHUB-SZMAIL02.tencent.com (10.14.6.23) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 2 Aug 2016 18:22:52 +0800
Received: from EXMBX-TJ019.tencent.com ([fe80::6d81:c55a:2a3c:353e]) by
	EXHUB-TJ03.tencent.com ([::1]) with mapi id 14.03.0123.003;
	Tue, 2 Aug 2016 18:22:52 +0800
From: =?gb2312?B?Zmlrc2h1KLr2s6+88yk=?= <fikshu@tencent.com>
To: qemu-devel <qemu-devel@nongnu.org>
CC: kwolf <kwolf@redhat.com>, stefanha <stefanha@redhat.com>, qemu-trivial
	<qemu-trivial@nongnu.org>
Thread-Topic: [PATCH] hw/ide: fix a writing to null pointer exception
Thread-Index: AdHsptE1UZA1pkQbQr65l72K1sUDSg==
Date: Tue, 2 Aug 2016 10:22:50 +0000
Message-ID: <C74630D0D1907C4A87964109A262FDDE51EC2406@EXMBX-TJ019.tencent.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.4.75.21]
Content-Type: multipart/alternative;
	boundary="_000_C74630D0D1907C4A87964109A262FDDE51EC2406EXMBXTJ019tence_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 183.57.53.109
X-Mailman-Approved-At: Tue, 02 Aug 2016 09:55:30 -0400
Subject: [Qemu-trivial] [PATCH] hw/ide: fix a writing to null pointer
 exception
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
X-List-Received-Date: Tue, 02 Aug 2016 10:37:40 -0000

--_000_C74630D0D1907C4A87964109A262FDDE51EC2406EXMBXTJ019tence_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

RnJvbSBiNWU1YzAxYjAyNWU4MzUwMGNhNDY2MjhhZGQ3ZjYzZjQyZjliMmFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogZmlrc2h1IDxmaWtzaHVAdGVuY2VudC5jb20+DQpEYXRlOiBU
dWUsIDIgQXVnIDIwMTYgMTc6Mzk6MTYgKzA4MDANClN1YmplY3Q6IFtQQVRDSF0gaHcvaWRlOiBm
aXggYSB3cml0aW5nIHRvIG51bGwgcG9pbnRlciBleGNlcHRpb24NCg0KSW4gcWVtdSBsZXNzIHRo
YW4gdjIuMS4zLCBpZGVfZmx1c2hfY2FjaGUgY2FsbHMgaWRlX2ZsdXNoX2NiIHdpdGggcy0+YnMg
PT0gTlVMTCwNCmFuZCBpZGVfZmx1c2hfY2IgY2FsbHMgYmRydl9hY2N0X2RvbmUgd2l0aG91dCBj
aGVjayBzLT5icyBuZWl0aGVyLiBGaW5hbGx5LA0KYmRydl9hY2N0X2RvbmUgd3JpdGluZyBzLT5i
cyBkaXJlY3RseSENCg0KUmVwb3J0ZWQtYnk6IGZpa3NodSA8Zmlrc2h1QHRlbmNlbnQuY29tPg0K
DQotLS0NCmh3L2lkZS9jb3JlLmMgfCA0ICsrKy0NCjEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2h3L2lkZS9jb3JlLmMgYi9ody9p
ZGUvY29yZS5jDQppbmRleCBmYTRjYWZhLi5jMzllZWRjIDEwMDY0NA0KLS0tIGEvaHcvaWRlL2Nv
cmUuYw0KKysrIGIvaHcvaWRlL2NvcmUuYw0KQEAgLTgzOSw3ICs4MzksOSBAQCBzdGF0aWMgdm9p
ZCBpZGVfZmx1c2hfY2Iodm9pZCAqb3BhcXVlLCBpbnQgcmV0KQ0KfQ0KfQ0KDQotIGJkcnZfYWNj
dF9kb25lKHMtPmJzLCAmcy0+YWNjdCk7DQorIGlmIChzLT5icyl7DQorIGJkcnZfYWNjdF9kb25l
KHMtPmJzLCAmcy0+YWNjdCk7DQorIH0NCnMtPnN0YXR1cyA9IFJFQURZX1NUQVQgfCBTRUVLX1NU
QVQ7DQppZGVfYXN5bmNfY21kX2RvbmUocyk7DQppZGVfc2V0X2lycShzLT5idXMpOw0KLS0NCjEu
OS4xDQo=

--_000_C74630D0D1907C4A87964109A262FDDE51EC2406EXMBXTJ019tence_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style>body { line-height: 1.5; }body { font-size: 10.5pt; font-family: =CE=
=A2=C8=ED=D1=C5=BA=DA; color: rgb(0, 0, 0); line-height: 1.5; }</style>
</head>
<body>
<div><span></span>From b5e5c01b025e83500ca46628add7f63f42f9b2ab Mon Sep 17 =
00:00:00 2001<br>
From: fikshu &lt;fikshu@tencent.com&gt;<br>
Date: Tue, 2 Aug 2016 17:39:16 &#43;0800<br>
Subject: [PATCH] hw/ide: fix a writing to null pointer exception<br>
<br>
In qemu less than v2.1.3, ide_flush_cache calls ide_flush_cb with s-&gt;bs =
=3D=3D NULL,<br>
and ide_flush_cb calls bdrv_acct_done without check s-&gt;bs neither. Final=
ly, <br>
bdrv_acct_done writing s-&gt;bs directly!</div>
<div><br>
</div>
<div>Reported-by: fikshu &lt;fikshu@tencent.com&gt;<br>
<br>
---<br>
hw/ide/core.c | 4 &#43;&#43;&#43;-<br>
1 file changed, 3 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/hw/ide/core.c b/hw/ide/core.c<br>
index fa4cafa..c39eedc 100644<br>
--- a/hw/ide/core.c<br>
&#43;&#43;&#43; b/hw/ide/core.c<br>
@@ -839,7 &#43;839,9 @@ static void ide_flush_cb(void *opaque, int ret)<br>
}<br>
}<br>
<br>
- bdrv_acct_done(s-&gt;bs, &amp;s-&gt;acct);<br>
&#43; if (s-&gt;bs){<br>
&#43; bdrv_acct_done(s-&gt;bs, &amp;s-&gt;acct);<br>
&#43; }<br>
s-&gt;status =3D READY_STAT | SEEK_STAT;<br>
ide_async_cmd_done(s);<br>
ide_set_irq(s-&gt;bus);<br>
-- <br>
1.9.1</div>
</body>
</html>

--_000_C74630D0D1907C4A87964109A262FDDE51EC2406EXMBXTJ019tence_--


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bUaAO-0000Ab-So
	for mharc-qemu-trivial@gnu.org; Tue, 02 Aug 2016 09:55:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chaojianhu@hotmail.com>) id 1bUXGx-0008L4-AH
	for qemu-trivial@nongnu.org; Tue, 02 Aug 2016 06:50:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chaojianhu@hotmail.com>) id 1bUXGq-0001Pf-8y
	for qemu-trivial@nongnu.org; Tue, 02 Aug 2016 06:50:05 -0400
Received: from blu004-omc2s12.hotmail.com ([65.55.111.87]:61328)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chaojianhu@hotmail.com>)
	id 1bUXGe-0001PA-QQ; Tue, 02 Aug 2016 06:49:48 -0400
Received: from BLU170-W46 ([65.55.111.71]) by BLU004-OMC2S12.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008); 
	Tue, 2 Aug 2016 03:49:48 -0700
X-TMN: [Sft/MnxniKFfc2Z9H3RhAsJkUybz4vP8dOf+xuq47OM=]
X-Originating-Email: [chaojianhu@hotmail.com]
Message-ID: <BLU170-W46ED7A69F09BE176EBAE72DB050@phx.gbl>
Content-Type: multipart/alternative;
	boundary="_d1e4ed14-2c3f-45c1-99f8-89bea9fe7eea_"
From: =?gb2312?B?uvazr7zz?= <chaojianhu@hotmail.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, "kwolf@redhat.com"
	<kwolf@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>
Date: Tue, 2 Aug 2016 18:49:47 +0800
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 02 Aug 2016 10:49:48.0155 (UTC)
	FILETIME=[96A714B0:01D1ECAB]
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 65.55.111.87
X-Mailman-Approved-At: Tue, 02 Aug 2016 09:55:31 -0400
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
X-List-Received-Date: Tue, 02 Aug 2016 10:50:13 -0000

--_d1e4ed14-2c3f-45c1-99f8-89bea9fe7eea_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

RnJvbSBiNWU1YzAxYjAyNWU4MzUwMGNhNDY2MjhhZGQ3ZjYzZjQyZjliMmFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMUZyb206IGNoYW9qaWFuaHUgPGNoYW9qaWFuaHVAaG90bWFpbC5jb20+RGF0
ZTogVHVlLCAyIEF1ZyAyMDE2IDE3OjM5OjE2ICswODAwU3ViamVjdDogW1BBVENIXSBody9pZGU6
IGZpeCBhIHdyaXRpbmcgdG8gbnVsbCBwb2ludGVyIGV4Y2VwdGlvbg0KSW4gcWVtdSBsZXNzIHRo
YW4gdjIuMS4zLCBpZGVfZmx1c2hfY2FjaGUgY2FsbHMgaWRlX2ZsdXNoX2NiIHdpdGggcy0+YnMg
PT0gTlVMTCxhbmQgaWRlX2ZsdXNoX2NiIGNhbGxzIGJkcnZfYWNjdF9kb25lIHdpdGhvdXQgY2hl
Y2tpbmcgcy0+YnMgbmVpdGhlci4gRmluYWxseSwgYmRydl9hY2N0X2RvbmUgd3JpdGVzIHMtPmJz
IGRpcmVjdGx5IQ0KUmVwb3J0ZWQtYnk6IGNoYW9qaWFuaHUgPGNoYW9qaWFuaHVAaG90bWFpbC5j
b20+U2lnbmVkLW9mZi1ieTogY2hhb2ppYW5odSA8Y2hhb2ppYW5odUBob3RtYWlsLmNvbT4NCi0t
LSBody9pZGUvY29yZS5jIHwgNCArKystIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCmRpZmYgLS1naXQgYS9ody9pZGUvY29yZS5jIGIvaHcvaWRlL2NvcmUu
Y2luZGV4IGZhNGNhZmEuLmMzOWVlZGMgMTAwNjQ0LS0tIGEvaHcvaWRlL2NvcmUuYysrKyBiL2h3
L2lkZS9jb3JlLmNAQCAtODM5LDcgKzgzOSw5IEBAIHN0YXRpYyB2b2lkIGlkZV9mbHVzaF9jYih2
b2lkICpvcGFxdWUsIGludCByZXQpICAgICAgICAgfSAgICAgfSAtICAgIGJkcnZfYWNjdF9kb25l
KHMtPmJzLCAmcy0+YWNjdCk7KyAgICBpZiAocy0+YnMpeysgICAgICAgIGJkcnZfYWNjdF9kb25l
KHMtPmJzLCAmcy0+YWNjdCk7KyAgICB9ICAgICBzLT5zdGF0dXMgPSBSRUFEWV9TVEFUIHwgU0VF
S19TVEFUOyAgICAgaWRlX2FzeW5jX2NtZF9kb25lKHMpOyAgICAgaWRlX3NldF9pcnEocy0+YnVz
KTstLSAxLjkuMQ0KIAkJIAkgICAJCSAg

--_d1e4ed14-2c3f-45c1-99f8-89bea9fe7eea_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxzdHlsZT48IS0tDQouaG1tZXNzYWdlIFANCnsNCm1hcmdpbjowcHg7
DQpwYWRkaW5nOjBweA0KfQ0KYm9keS5obW1lc3NhZ2UNCnsNCmZvbnQtc2l6ZTogMTJwdDsNCmZv
bnQtZmFtaWx5Os6iyO3RxbraDQp9DQotLT48L3N0eWxlPjwvaGVhZD4NCjxib2R5IGNsYXNzPSdo
bW1lc3NhZ2UnPjxkaXYgZGlyPSdsdHInPjxkaXY+RnJvbSBiNWU1YzAxYjAyNWU4MzUwMGNhNDY2
MjhhZGQ3ZjYzZjQyZjliMmFiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMTwvZGl2PjxkaXY+RnJv
bTogY2hhb2ppYW5odSAmbHQ7Y2hhb2ppYW5odUBob3RtYWlsLmNvbSZndDs8L2Rpdj48ZGl2PkRh
dGU6IFR1ZSwgMiBBdWcgMjAxNiAxNzozOToxNiArMDgwMDwvZGl2PjxkaXY+U3ViamVjdDogW1BB
VENIXSBody9pZGU6IGZpeCBhIHdyaXRpbmcgdG8gbnVsbCBwb2ludGVyIGV4Y2VwdGlvbjwvZGl2
PjxkaXY+PGJyPjwvZGl2PjxkaXY+SW4gcWVtdSBsZXNzIHRoYW4gdjIuMS4zLCBpZGVfZmx1c2hf
Y2FjaGUgY2FsbHMgaWRlX2ZsdXNoX2NiIHdpdGggcy0mZ3Q7YnMgPT0gTlVMTCw8L2Rpdj48ZGl2
PmFuZCBpZGVfZmx1c2hfY2IgY2FsbHMgYmRydl9hY2N0X2RvbmUgd2l0aG91dCBjaGVja2luZyBz
LSZndDticyBuZWl0aGVyLiBGaW5hbGx5LCZuYnNwOzwvZGl2PjxkaXY+YmRydl9hY2N0X2RvbmUg
d3JpdGVzIHMtJmd0O2JzIGRpcmVjdGx5ITwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+UmVwb3J0
ZWQtYnk6IGNoYW9qaWFuaHUgJmx0O2NoYW9qaWFuaHVAaG90bWFpbC5jb20mZ3Q7PC9kaXY+PGRp
dj5TaWduZWQtb2ZmLWJ5OiZuYnNwOzxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHQ7Ij5jaGFv
amlhbmh1ICZsdDtjaGFvamlhbmh1QGhvdG1haWwuY29tJmd0Ozwvc3Bhbj48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2Pi0tLTwvZGl2PjxkaXY+Jm5ic3A7aHcvaWRlL2NvcmUuYyB8IDQgKysrLTwv
ZGl2PjxkaXY+Jm5ic3A7MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+ZGlmZiAtLWdpdCBhL2h3L2lkZS9jb3JlLmMg
Yi9ody9pZGUvY29yZS5jPC9kaXY+PGRpdj5pbmRleCBmYTRjYWZhLi5jMzllZWRjIDEwMDY0NDwv
ZGl2PjxkaXY+LS0tIGEvaHcvaWRlL2NvcmUuYzwvZGl2PjxkaXY+KysrIGIvaHcvaWRlL2NvcmUu
YzwvZGl2PjxkaXY+QEAgLTgzOSw3ICs4MzksOSBAQCBzdGF0aWMgdm9pZCBpZGVfZmx1c2hfY2Io
dm9pZCAqb3BhcXVlLCBpbnQgcmV0KTwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwO308L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7fTwvZGl2PjxkaXY+Jm5i
c3A7PC9kaXY+PGRpdj4tICZuYnNwOyAmbmJzcDtiZHJ2X2FjY3RfZG9uZShzLSZndDticywgJmFt
cDtzLSZndDthY2N0KTs8L2Rpdj48ZGl2PisgJm5ic3A7ICZuYnNwO2lmIChzLSZndDticyl7PC9k
aXY+PGRpdj4rICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO2JkcnZfYWNjdF9kb25lKHMtJmd0
O2JzLCAmYW1wO3MtJmd0O2FjY3QpOzwvZGl2PjxkaXY+KyAmbmJzcDsgJm5ic3A7fTwvZGl2Pjxk
aXY+Jm5ic3A7ICZuYnNwOyAmbmJzcDtzLSZndDtzdGF0dXMgPSBSRUFEWV9TVEFUIHwgU0VFS19T
VEFUOzwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwOyAmbmJzcDtpZGVfYXN5bmNfY21kX2RvbmUocyk7
PC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7ICZuYnNwO2lkZV9zZXRfaXJxKHMtJmd0O2J1cyk7PC9k
aXY+PGRpdj4tLSZuYnNwOzwvZGl2PjxkaXY+MS45LjE8L2Rpdj48ZGl2Pjxicj48L2Rpdj4gCQkg
CSAgIAkJICA8L2Rpdj48L2JvZHk+DQo8L2h0bWw+

--_d1e4ed14-2c3f-45c1-99f8-89bea9fe7eea_--


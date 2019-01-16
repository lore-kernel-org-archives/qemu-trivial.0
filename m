Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gjqMT-0003Jt-RO
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2019 13:56:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nshah@disroot.org>) id 1gjq0m-0004f2-Af
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2019 13:34:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nshah@disroot.org>) id 1gjq0l-0000z9-FF
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2019 13:34:00 -0500
Received: from knopi.disroot.org ([178.21.23.139]:34636)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <nshah@disroot.org>)
	id 1gjq0h-0000r4-2W; Wed, 16 Jan 2019 13:33:55 -0500
Received: from localhost (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DCABD222A3;
	Wed, 16 Jan 2019 19:33:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
	by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2YEf_th_woEC; Wed, 16 Jan 2019 19:33:50 +0100 (CET)
From: Nisarg Shah <nshah@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1547663630; bh=lvLdC18hj5zjinUEr1gcqVPf747kt1h9ImZoORQaIEw=;
	h=From:To:Cc:Subject:Date;
	b=PO/pqUUVduMKEflkoW9tkZNKRNUeWKPDQtFcsI0YUiEaHt/ACXPBhhmk3JoU/agw7
	sV/aLoSiGhI98uHVrRyiBLocw/pj+WYoNAmHH2YJRBSy3X9cWBywBav6/pbNol5+PN
	KbqTNOblO/Y3Gd0kRBo60A+1Sc/bZnD9oLezwIC1YQMNKy0R57Mq38yPcTxJA9muK8
	HaflNff+A/ZGagOmoNWrpw29+zn0RJ0XDpuJm6TAafS6O08dxvOhiphNC7AabKrNlv
	lebYA3jGCd3BBmQ2MEMdX/4KOwykfFzSuzdi8L4hbiHt8Pde9KzYruPzC5rsUXJi94
	IIQV3+j3t7uzg==
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, ehabkost@redhat.com,
	Nisarg Shah <nshah@disroot.org>
Date: Thu, 17 Jan 2019 00:03:58 +0530
Message-Id: <20190116183358.30287-1-nshah@disroot.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.21.23.139
X-Mailman-Approved-At: Wed, 16 Jan 2019 13:56:24 -0500
Subject: [Qemu-trivial] [PATCH] device-crash-test: Convert to Python 3
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
X-List-Received-Date: Wed, 16 Jan 2019 18:34:02 -0000

Apply 2to3 tool to scripts/device-crash-test.
Restrict whitelist entry stats in debug mode to be sorted only by "count"=
, since Python 3 does
not implicitly support comparing dictionaries.

Signed-off-by: Nisarg Shah <nshah@disroot.org>
---
 scripts/device-crash-test | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index e93a7c0c84..ecdc9828c2 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -23,7 +23,7 @@
 Run QEMU with all combinations of -machine and -device types,
 check for crashes and unexpected errors.
 """
-from __future__ import print_function
+
=20
 import sys
 import os
@@ -272,7 +272,7 @@ def qemuOptsEscape(s):
=20
 def formatTestCase(t):
     """Format test case info as "key=3Dvalue key=3Dvalue" for prettier l=
ogging output"""
-    return ' '.join('%s=3D%s' % (k, v) for k, v in t.items())
+    return ' '.join('%s=3D%s' % (k, v) for k, v in list(t.items()))
=20
=20
 def qomListTypeNames(vm, **kwargs):
@@ -574,7 +574,8 @@ def main():
         logger.info("Skipped %d test cases", skipped)
=20
     if args.debug:
-        stats =3D sorted([(len(wl_stats.get(i, [])), wl) for i, wl in en=
umerate(ERROR_WHITELIST)])
+        stats =3D sorted([(len(wl_stats.get(i, [])), wl) for i, wl in
+                         enumerate(ERROR_WHITELIST)], key=3Dlambda x: x[=
0])
         for count, wl in stats:
             dbg("whitelist entry stats: %d: %r", count, wl)
=20
--=20
2.19.2



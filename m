Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z5Hi5-0003Jq-QJ
	for mharc-qemu-trivial@gnu.org; Wed, 17 Jun 2015 14:05:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z5Hi2-0003Fx-CG
	for qemu-trivial@nongnu.org; Wed, 17 Jun 2015 14:05:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z5Hi1-0003nC-7B
	for qemu-trivial@nongnu.org; Wed, 17 Jun 2015 14:05:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39839)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z5Hhu-0003UK-Lk; Wed, 17 Jun 2015 14:05:02 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D32744186B;
	Wed, 17 Jun 2015 21:05:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id C49B2A52;
	Wed, 17 Jun 2015 21:05:00 +0300 (MSK)
Received: (nullmailer pid 7418 invoked by uid 1000);
	Wed, 17 Jun 2015 18:05:00 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed, 17 Jun 2015 21:05:00 +0300
Message-Id: <1434564300-7372-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH] libcacard: pkgconfig: tidy dependent libs
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
X-List-Received-Date: Wed, 17 Jun 2015 18:05:12 -0000

libcacard.pc file lists only one package in Requires
field, which is nss, while glib-2.0 is also a requiriment.
Furthermore, for libraries used internally by the library
(this is the way nss and glib are used by libcacard),
Requires.private shold be used instead of Requires.

Fix both issues.

This does not affect linking of qemu because it links
with objects from libcacard directly.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 libcacard/libcacard.pc.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libcacard/libcacard.pc.in b/libcacard/libcacard.pc.in
index b6859b0..4b60023 100644
--- a/libcacard/libcacard.pc.in
+++ b/libcacard/libcacard.pc.in
@@ -7,7 +7,7 @@ Name: cacard
 Description: CA Card library
 Version: @VERSION@
 
-Requires:  nss
+Requires.private: nss glib-2.0
 Libs: -L${libdir} -lcacard
 Libs.private:
 Cflags: -I${includedir}
-- 
2.1.4



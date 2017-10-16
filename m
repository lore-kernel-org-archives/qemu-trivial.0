Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4CNh-0006Kw-ET
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 16:53:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4CNe-0006IA-LD
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:52:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4CNd-0004gj-Ua
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:52:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47689)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1e4CNZ-0004c9-KW; Mon, 16 Oct 2017 16:52:53 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6C18C40D2B;
	Mon, 16 Oct 2017 23:52:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id EF68FB31;
	Mon, 16 Oct 2017 23:33:43 +0300 (MSK)
Received: (nullmailer pid 12311 invoked by uid 1000);
	Mon, 16 Oct 2017 20:33:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 23:33:28 +0300
Message-Id: <326c4c3c48fdd4a5bf4f14abc95787440ac1acec.1508185933.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 01/14] qemu-doc.texi: remove trailing
 whitespace
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
X-List-Received-Date: Mon, 16 Oct 2017 20:53:00 -0000

Remove trailing whitespace in qemu-doc.texi, as it causes
reproducibility issues depending on the echo implementation
used by the Makefile.

Reported-By: Vagrant Cascadian <vagrant@debian.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qemu-doc.texi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index d8bb2c664f..8c10956a66 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -105,7 +105,7 @@ QEMU full system emulation has the following features:
 QEMU uses a full software MMU for maximum portability.
 
 @item
-QEMU can optionally use an in-kernel accelerator, like kvm. The accelerators 
+QEMU can optionally use an in-kernel accelerator, like kvm. The accelerators
 execute most of the guest code natively, while
 continuing to emulate the rest of the machine.
 
-- 
2.11.0



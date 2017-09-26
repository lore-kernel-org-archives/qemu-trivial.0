Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwj47-00059r-Tm
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 02:09:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwj46-00058a-0a
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 02:09:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwj45-0000ls-3V
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 02:09:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48701)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwj3y-0000ho-W7; Tue, 26 Sep 2017 02:09:47 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 28FBC41F8B;
	Tue, 26 Sep 2017 09:09:46 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id DAB0217;
	Tue, 26 Sep 2017 09:09:45 +0300 (MSK)
Received: (nullmailer pid 6007 invoked by uid 1000);
	Tue, 26 Sep 2017 06:09:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 26 Sep 2017 09:09:44 +0300
Message-Id: <20170926060944.5962-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PATCH] qemu-doc.texi: remove trailing whitespace
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
X-List-Received-Date: Tue, 26 Sep 2017 06:09:55 -0000

Reported-By: Vagrant Cascadian <vagrant@debian.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-doc.texi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 4076226f39..de23fca9dc 100644
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



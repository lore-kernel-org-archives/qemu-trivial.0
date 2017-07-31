Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dc7pk-0004CM-Cy
	for mharc-qemu-trivial@gnu.org; Mon, 31 Jul 2017 06:21:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7pf-00047M-PX
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:21:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc7pf-0006BJ-29
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:21:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48177)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dc7pa-00068O-LJ; Mon, 31 Jul 2017 06:21:46 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E25CA42ABD;
	Mon, 31 Jul 2017 13:21:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B7B6AB79;
	Mon, 31 Jul 2017 13:21:43 +0300 (MSK)
Received: (nullmailer pid 5542 invoked by uid 1000);
	Mon, 31 Jul 2017 10:21:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eduardo Otubo <otubo@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 31 Jul 2017 13:21:21 +0300
Message-Id: <36bed541ca886da735bef1e8d76d09f8849ed5dd.1501496349.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 02/25] fix qemu-system-unicore32 crashing when
 calling without -kernel
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
X-List-Received-Date: Mon, 31 Jul 2017 10:21:53 -0000

From: Eduardo Otubo <otubo@redhat.com>

Starting qemu-system-unicore32 without the -kernel parameter results in
an assert() returns false and aborts qemu. This patch replaces it with a
proper error message followed by exit(1).

Signed-off-by: Eduardo Otubo <otubo@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/unicore32/puv3.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/unicore32/puv3.c b/hw/unicore32/puv3.c
index e9d1a60b6f..ff62efb4df 100644
--- a/hw/unicore32/puv3.c
+++ b/hw/unicore32/puv3.c
@@ -92,7 +92,10 @@ static void puv3_load_kernel(const char *kernel_filename)
     if (kernel_filename == NULL && qtest_enabled()) {
         return;
     }
-    assert(kernel_filename != NULL);
+    if (kernel_filename == NULL) {
+        error_report("kernel parameter cannot be empty");
+        exit(1);
+    }
 
     /* only zImage format supported */
     size = load_image_targphys(kernel_filename, KERNEL_LOAD_ADDR,
-- 
2.11.0



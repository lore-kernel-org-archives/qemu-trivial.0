Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN4Bh-00055u-Gf
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 13:08:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4Bb-0004tn-84
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:08:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4BW-0003Gc-N4
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:08:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34309)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VN4BJ-0003DT-An; Fri, 20 Sep 2013 13:07:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 21210419BE;
	Fri, 20 Sep 2013 21:07:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D184A51D;
	Fri, 20 Sep 2013 20:58:22 +0400 (MSK)
Received: (nullmailer pid 32188 invoked by uid 1000);
	Fri, 20 Sep 2013 16:58:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Fri, 20 Sep 2013 20:58:11 +0400
Message-Id: <1379696296-32105-13-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Tobias Markus <tobias@markus-regensburg.de>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 12/17] target-i386: Fix segment cache dump
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
X-List-Received-Date: Fri, 20 Sep 2013 17:08:11 -0000

From: Tobias Markus <tobias@markus-regensburg.de>

When in Long Mode, cpu_x86_seg_cache() logs "DS16" because the Default
operation size bit (D/B bit) is not set for Long Mode Data Segments since
there are only Data Segments in Long Mode and no explicit 16/32/64-bit
Descriptors.
This patch fixes this by checking the Long Mode Active bit of the hidden
flags variable and logging "DS" if it is set. (I.e. in Long Mode all Data
Segments are logged as "DS")

Signed-off-by: Tobias Markus <tobias@markus-regensburg.de>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-i386/helper.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target-i386/helper.c b/target-i386/helper.c
index 8bf85ec..35f09d2 100644
--- a/target-i386/helper.c
+++ b/target-i386/helper.c
@@ -147,7 +147,9 @@ cpu_x86_dump_seg_cache(CPUX86State *env, FILE *f, fprintf_function cpu_fprintf,
             cpu_fprintf(f, " [%c%c", (sc->flags & DESC_C_MASK) ? 'C' : '-',
                         (sc->flags & DESC_R_MASK) ? 'R' : '-');
         } else {
-            cpu_fprintf(f, (sc->flags & DESC_B_MASK) ? "DS  " : "DS16");
+            cpu_fprintf(f,
+                        (sc->flags & DESC_B_MASK || env->hflags & HF_LMA_MASK)
+                        ? "DS  " : "DS16");
             cpu_fprintf(f, " [%c%c", (sc->flags & DESC_E_MASK) ? 'E' : '-',
                         (sc->flags & DESC_W_MASK) ? 'W' : '-');
         }
-- 
1.7.10.4



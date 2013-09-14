Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKw81-0000mR-Ce
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 16:07:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKw7z-0000k7-FJ
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 16:07:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKw7y-0003XG-EU
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 16:07:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58448)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKw7w-0003WL-H5; Sat, 14 Sep 2013 16:07:32 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 07F2A4114E;
	Sun, 15 Sep 2013 00:07:31 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8C79C501;
	Sat, 14 Sep 2013 23:47:44 +0400 (MSK)
Received: (nullmailer pid 7717 invoked by uid 1000);
	Sat, 14 Sep 2013 19:47:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sat, 14 Sep 2013 23:47:38 +0400
Message-Id: <1379188061-7634-13-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Tobias Markus <tobias@markus-regensburg.de>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 12/15] target-i386: Fix segment cache dump
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
X-List-Received-Date: Sat, 14 Sep 2013 20:07:36 -0000

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
index 7c58e27..eef3334 100644
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



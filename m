Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0Aip-0000XO-5e
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 11:36:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z0Aik-0000QC-6O
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 11:36:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z0Aij-0004oh-B8
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 11:36:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40391)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z0Aia-0004hH-T8; Wed, 03 Jun 2015 11:36:37 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0AAB9407DE;
	Wed,  3 Jun 2015 18:36:34 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 11087A52;
	Wed,  3 Jun 2015 16:08:53 +0300 (MSK)
Received: (nullmailer pid 27430 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:29 +0300
Message-Id: <bd4baf6eebff75c7e0c67a729d1bdb5b0b36fe72.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 09/30] vl: fix memory leak spotted by valgrind
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
X-List-Received-Date: Wed, 03 Jun 2015 15:36:49 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==9276== 13 bytes in 1 blocks are definitely lost in loss record 1,046 of 3,673
==9276==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==9276==    by 0x2EAFBB: malloc_and_trace (vl.c:2556)
==9276==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==9276==    by 0x4A28BD: addr_to_string (vnc.c:123)
==9276==    by 0x4A29AD: vnc_socket_local_addr (vnc.c:139)
==9276==    by 0x4A9AFE: vnc_display_local_addr (vnc.c:3240)
==9276==    by 0x2EF4FE: main (vl.c:4321)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index 1d4c089..3893c84 100644
--- a/vl.c
+++ b/vl.c
@@ -4312,8 +4312,9 @@ int main(int argc, char **argv, char **envp)
     /* init remote displays */
     qemu_opts_foreach(qemu_find_opts("vnc"), vnc_init_func, NULL, 0);
     if (show_vnc_port) {
-        printf("VNC server running on `%s'\n",
-               vnc_display_local_addr("default"));
+        char *ret = vnc_display_local_addr("default");
+        printf("VNC server running on `%s'\n", ret);
+        g_free(ret);
     }
 #endif
 #ifdef CONFIG_SPICE
-- 
2.1.4


